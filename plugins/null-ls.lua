return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"


    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      -- null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.formatting.prettier,
      --
      -- diagnostics
      null_ls.builtins.diagnostics.golangci_lint,
      null_ls.builtins.diagnostics.buf,
      null_ls.builtins.diagnostics.yamllint,
      null_ls.builtins.diagnostics.clang_check,
      -- formatters
      null_ls.builtins.formatting.buf,
      null_ls.builtins.formatting.black.with { extra_args = { "--fast", "--line-length=79" } },
      null_ls.builtins.formatting.clang_format,
    }
    return config -- return final config table
  end,
}
