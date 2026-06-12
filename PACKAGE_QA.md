# Package QA Checklist

## Required files

- [x] index.html
- [x] README.md
- [x] DEPLOYMENT.md
- [x] CODEX_PROMPT.md
- [x] MANIFEST.json
- [x] .nojekyll
- [x] .github/workflows/pages.yml
- [x] scripts/setup_pages_branch.sh
- [x] scripts/setup_pages_branch.ps1
- [x] scripts/generate_qr.py
- [x] scripts/export_pdf_playwright.js

## Validation

- [x] `MANIFEST.json` generated after file assembly.
- [x] `MANIFEST.json` includes itself and all required deployment files.
- [x] Zip package generated from project root contents, not parent directory.
- [x] No `__pycache__`, `.pyc`, `.DS_Store`, `.generated_at`, or temporary backup files included.

## Next gate

- Publish via Codex / GitHub CLI.
- Run Release Audit against the live Pages URL.
