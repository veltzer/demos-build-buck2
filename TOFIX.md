# TOFIX

Findings from a code scan on 2026-10-04.

## Medium

- `line_count/.buckconfig:25` - `buck_out = out` puts build output in `line_count/out/`, which neither the root `.gitignore` (`/out/` only matches the repo root) nor `line_count/.gitignore` (lists `buck-out/` and `.buck-out/`) ignores, so running `line_count/build.sh` leaves untracked output. Add `out/` to `line_count/.gitignore`, or drop the `buck_out` line so the already-ignored default `buck-out` is used.

## Low

- `README.md:2` - the README does not say what the demo is or how to run it (`line_count/build.sh`, needing a `buck2` binary on PATH); add a short usage section.
