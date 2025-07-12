require "nvchad.mappings"
-- add yours here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }


keymap.set("n", ";", ":", { desc = "CMD enter command mode" })
keymap.set("i", "jk", "<ESC>")

keymap.set("n", "d", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save file and quit
keymap.set("n", "<Leader>w", ":update<Return>", opts)
keymap.set("n", "<Leader>q", ":quit<Return>", opts)
keymap.set("n", "<Leader>Q", ":qa<Return>", opts)

-- File explorer with NvimTree
keymap.set("n", "<Leader>f", ":NvimTreeFindFile<Return>", opts)
keymap.set("n", "<Leader>t", ":NvimTreeToggle<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
-- keymap.set("n", "<C-S-h>", "<C-w><")
-- keymap.set("n", "<C-S-l>", "<C-w>>")
-- keymap.set("n", "<C-S-k>", "<C-w>+")
-- keymap.set("n", "<C-S-j>", "<C-w>-")

-- Resize usando Ctrl + Alt
keymap.set("n", "<C-M-h>", "<C-w><", opts) -- angosta
keymap.set("n", "<C-M-l>", "<C-w>>", opts) -- más ancha
keymap.set("n", "<C-M-k>", "<C-w>+", opts) -- más alta
keymap.set("n", "<C-M-j>", "<C-w>-", opts) -- más baja

-- Diagnostics
keymap.set("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, opts)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
