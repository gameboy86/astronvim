return {
  {
    "EdenEast/nightfox.nvim",
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    event = "User AstroFile",
    cmd = { "TodoQuickFix" },
    keys = {
      {
        "<leader>T",
        "<cmd>TodoTelescope<cr>",
        desc = "Open TODOs in Telescope",
      },
    },
  },
  {
    'tpope/vim-fugitive',
    lazy = false
  },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.json" },
  {
    "p00f/clangd_extensions.nvim", -- install lsp plugin
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        ensure_installed = { "clangd" }, -- automatically install lsp
      },
    },
  },
  {
    "sopa0/telescope-makefile",
    opts = function(_, opts)
      require'telescope'.load_extension('make')
      opts.default_target = nil
      return opts
    end,
    event = "User AstroFile",
    keys = {
      {
        "<leader>m",
        "<cmd>Telescope make<cr>",
        "Make Targets",
      }
    }
  },
  {
    "nvim-focus/focus.nvim",
    event = "User AstroFile",
    opts = function(_, opts)
      local ignore_filetypes = { 'neo-tree' }
      local ignore_buftypes = { 'nofile', 'prompt', 'popup' }

      local augroup =
        vim.api.nvim_create_augroup('FocusDisable', { clear = true })

      vim.api.nvim_create_autocmd('WinEnter', {
        group = augroup,
        callback = function(_)
            if vim.tbl_contains(ignore_buftypes, vim.bo.buftype)
            then
                vim.w.focus_disable = true
            else
                vim.w.focus_disable = false
            end
        end,
        desc = 'Disable focus autoresize for BufType',
      })

      vim.api.nvim_create_autocmd('FileType', {
        group = augroup,
        callback = function(_)
            if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
                vim.w.focus_disable = true
            else
                vim.w.focus_disable = false
            end
        end,
        desc = 'Disable focus autoresize for FileType',
      })

      opts.autoresize = {
        enable = true,
        width = 80,
      }
      return opts
    end,
  }
}
