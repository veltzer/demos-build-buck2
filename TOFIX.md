# TOFIX

Findings from a code scan on 2026-10-04.

## Medium

- `line_count/.buckconfig:3` and `line_count/.buckconfig:17-18` - the `prelude` cell points at the `prelude` directory (the `facebook/buck2-prelude` submodule from `.gitmodules:1-3`), but `[external_cells] prelude = bundled` overrides it with the copy bundled in the buck2 binary, so the submodule is never used. Either delete the `[external_cells]` section (and keep the submodule pinned to a revision that matches the buck2 version in use) or drop the submodule and the comment block at `rsconstruct.toml:7-11`.
- `line_count/.buckconfig:25` - `buck_out = out` puts build output in `line_count/out/`, which neither the root `.gitignore` (`/out/` only matches the repo root) nor `line_count/.gitignore` (lists `buck-out/` and `.buck-out/`) ignores, so running `line_count/build.sh` leaves untracked output. Add `out/` to `line_count/.gitignore`, or drop the `buck_out` line so the already-ignored default `buck-out` is used.

## Low

- `rsconstruct.toml:24` - `src_exclude_dirs = ["prelude"]` on rumdl does nothing because the processor only reads `src_files = ["README.md"]`; remove it.
- `README.md:2` - the README does not say what the demo is or how to run it (`line_count/build.sh`, needing a `buck2` binary on PATH); add a short usage section.
