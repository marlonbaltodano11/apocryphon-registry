#!/usr/bin/env node

/**
 * Generate (or check) registry.json from the skills/ folder.
 *
 * The index is the generated source of truth for consumers: run
 * `npm run generate-index` after adding or editing a skill. CI runs
 * `npm run check-index` and fails if registry.json is out of date.
 *
 * This script only needs gray-matter; everything else is Node built-ins.
 */
import { promises as fs } from 'node:fs'
import path from 'node:path'
import process from 'node:process'
import matter from 'gray-matter'

const ROOT = process.cwd()
const SKILLS_DIR = path.join(ROOT, 'skills')
const INDEX_FILE = path.join(ROOT, 'registry.json')
const CHECK = process.argv.includes('--check')

function fail(message) {
  console.error(`error: ${message}`)
  process.exit(1)
}

async function readIndex() {
  try {
    return JSON.parse(await fs.readFile(INDEX_FILE, 'utf8'))
  } catch (error) {
    fail(`Could not read registry.json: ${error.message}`)
  }
}

async function buildSkill(entry) {
  if (!entry.isDirectory()) return null
  const dir = path.join(SKILLS_DIR, entry.name)
  const file = path.join(dir, 'SKILL.md')

  let raw
  try {
    raw = await fs.readFile(file, 'utf8')
  } catch {
    fail(`skills/${entry.name} has no SKILL.md`)
  }

  const parsed = matter(raw)
  const data = parsed.data ?? {}
  const tags = Array.isArray(data.tags) ? data.tags.filter((tag) => typeof tag === 'string') : []

  return {
    id: entry.name,
    ...(data.version ? { version: String(data.version) } : {}),
    ...(data.description ? { description: String(data.description).trim() } : {}),
    ...(data.category ? { category: String(data.category) } : {}),
    path: `skills/${entry.name}`,
    ...(tags.length > 0 ? { tags } : {}),
  }
}

async function main() {
  const current = await readIndex()

  let entries
  try {
    entries = await fs.readdir(SKILLS_DIR, { withFileTypes: true })
  } catch (error) {
    fail(`Could not read skills/: ${error.message}`)
  }

  const skills = []
  for (const entry of entries.sort((a, b) => a.name.localeCompare(b.name))) {
    const skill = await buildSkill(entry)
    if (skill) skills.push(skill)
  }

  const next = {
    name: current.name ?? 'apocryphon-registry',
    version: 1,
    ...(current.taxonomy ? { taxonomy: current.taxonomy } : {}),
    packs: current.packs ?? {},
    skills,
  }

  const serialized = `${JSON.stringify(next, null, 2)}\n`

  if (CHECK) {
    const previous = `${JSON.stringify(current, null, 2)}\n`
    if (previous !== serialized) {
      console.error('registry.json is out of date. Run `npm run generate-index` and commit the result.')
      process.exit(1)
    }
    console.log('registry.json is up to date.')
    return
  }

  await fs.writeFile(INDEX_FILE, serialized, 'utf8')
  console.log(`registry.json updated (${skills.length} skills).`)
}

await main()
