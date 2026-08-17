---@type LazySpec
-- nvim-lint cancels the previous golangci-lint proc via SIGINT whenever a
-- new lint event fires (lint.lua:104-106). golangci-lint v2 treats SIGINT as
-- exit code 3 ("context canceled"), which nvim-lint then notifies on
-- (lint.lua:431-435). Real lint diagnostics are parsed from JSON stdout
-- (golangcilint.lua:104-138) regardless of exit code, so suppressing the
-- non-zero-exit notification loses nothing.
return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        golangcilint = {
          ignore_exitcode = true,
        },
      },
    },
  },
}
