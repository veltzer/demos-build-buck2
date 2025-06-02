#!/bin/bash -eu

# buck2 build //... --out out
# buck2 build :count_lines --out out
buck2 build --no-buckd :
