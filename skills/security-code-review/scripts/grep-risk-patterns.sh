#!/usr/bin/env bash
set -euo pipefail

echo "Patrones de riesgo (revisión manual requerida):"

patterns='eval\(|new Function\(|child_process|execSync\(|dangerouslySetInnerHTML|innerHTML[[:space:]]*=|pickle\.loads\(|yaml\.load\(|verify[[:space:]]*=[[:space:]]*False|SELECT[[:space:]].*\+'

grep -rnEI "$patterns" --include='*.js' --include='*.ts' --include='*.tsx' --include='*.jsx' --include='*.py' --include='*.go' --include='*.rb' --include='*.php' . 2>/dev/null | grep -v node_modules | head -50 || true

echo "Revisa cada coincidencia contra el flujo real; esto no es una prueba de seguridad."
