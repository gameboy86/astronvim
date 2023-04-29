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
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.json" },
}
