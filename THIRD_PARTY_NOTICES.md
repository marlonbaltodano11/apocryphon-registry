# Third-party notices

This catalog contains skills adapted from third-party repositories. The MIT
license in the repository root covers the original catalog code and the skills
marked `license: MIT`. Skills marked `license: CC-BY-SA-4.0` are distributed
under that license and identify the upstream work in their `SOURCE.md` file.

## Upstream sources

| Source | Pinned commit | License | Adapted skills |
|---|---|---|---|
| [mattpocock/skills](https://github.com/mattpocock/skills) | `5863806dd4e1` | MIT | `tdd`, `diagnosing-bugs`, `code-review`, `codebase-design`, `domain-modeling`, `writing-for-agents` |
| [obra/superpowers](https://github.com/obra/superpowers) | `22f0b463e7a5` | MIT | `writing-plans`, `verification-before-completion`, `receiving-code-review`, `using-git-worktrees` |
| [trailofbits/skills](https://github.com/trailofbits/skills) | `149d7b21f406` | CC-BY-SA-4.0 | `modern-python`, `differential-review`, `property-based-testing` |
| [supabase/agent-skills](https://github.com/supabase/agent-skills) | `c9be0e931b79` | MIT | `postgres-best-practices` |
| [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) | `1a2c79d4e6c4` | MIT (declared in README and skill metadata; no standalone LICENSE file) | `react-best-practices`, `composition-patterns` |
| [vercel-labs/web-interface-guidelines](https://github.com/vercel-labs/web-interface-guidelines) | `434b7f913646` | MIT | `web-interface-guidelines` |
| [vercel/next.js](https://github.com/vercel/next.js) | `5395cf44d1fc` | MIT | `next-dev-loop` |
| [dotnet/skills](https://github.com/dotnet/skills) | `2877c712edc2` | MIT | `dotnet-webapi`, `dotnet-run-tests` |

The stars, forks, and repository URLs in the catalog README are informational
signals, not a claim of endorsement by the upstream maintainers.

## Modifications

Unless a skill's `SOURCE.md` says otherwise, the adaptations:

- replace the upstream frontmatter with the Apocryphon contract;
- add an English catalog description with activation and exclusion triggers;
- trim or reorganize the main `SKILL.md` body to the catalog size limit;
- move long documentation into `references/`;
- remove host-specific agent, plugin, and marketplace references that do not
  apply across Claude Code, Cursor, and OpenCode;
- preserve the upstream technical recommendations and code examples.

The Trail of Bits adaptations are derivative works under CC-BY-SA-4.0. Their
`SOURCE.md` files identify the upstream authors, commit, license, and the
changes made. The rest of the catalog is distributed under the root MIT
license except where a file states otherwise.

## License texts

- [MIT: obra/superpowers](LICENSES/MIT-superpowers.txt)
- [MIT: mattpocock/skills](LICENSES/MIT-mattpocock.txt)
- [MIT: dotnet/skills](LICENSES/MIT-dotnet.txt)
- [MIT: supabase/agent-skills](LICENSES/MIT-supabase.txt)
- [MIT: vercel/next.js](LICENSES/MIT-vercel-nextjs.txt)
- [MIT: vercel-labs/agent-skills](LICENSES/MIT-vercel-labs-agent-skills.txt)
- [MIT: vercel-labs/web-interface-guidelines](LICENSES/MIT-web-interface-guidelines.txt)
- [CC-BY-SA-4.0: trailofbits/skills](LICENSES/CC-BY-SA-4.0-trailofbits.txt)
