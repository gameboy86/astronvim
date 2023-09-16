-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    ["<space>"] = { "za", desc = "Folding" },
    ["<leader><space>"] = { ":noh<CR>", desc = "Clear Selected" },
    ["oo"] = { "o<ESC>", desc = "Insert new line bottom" },
    ["OO"] = { "O<ESC>", desc = "Insert new line above" },
    ["ss"] = { "i<space><ESC>", desc = "Insert space" },
    ["a<CR>"] = { "i<CR><ESC>" },
    ["<leader>h"] = { ":<C-u>split<CR>" },
    ["<leader>v"] = { ":<C-u>vsplit<CR>" },
    ["<S-l>"] = { ":bnext<CR>" },
    ["<S-h>"] = { ":bprevious<CR>" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<C-h>"] = {"<cmd> TmuxNavigateLeft<CR>", desc="window left"},
    ["<C-l>"] = {"<cmd> TmuxNavigateRight<CR>", desc="window right"},
    ["<C-j>"] = {"<cmd> TmuxNavigateDown<CR>", desc="window down"},
    ["<C-k>"] = {"<cmd> TmuxNavigateUp<CR>", desc="window up"},
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
