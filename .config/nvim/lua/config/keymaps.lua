-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Navegar entre buffers con tabulador en modo normal
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Siguiente buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Buffer anterior" })
vim.keymap.set("n", "<C-a>", "gg<S-v>G")
-- Sobrescribir el keybinding por defecto de LazyVim para Neo-tree
vim.keymap.set("n", "<leader>fT", function()
  require("snacks").terminal.new()
end, { desc = "Nueva terminal independiente" })
