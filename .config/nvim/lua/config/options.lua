-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.shell = "pwsh.exe"
vim.opt.clipboard = "unnamedplus"
vim.g.lazyvim_php_lsp = "intelephense"
vim.opt.wrap = true
vim.opt.scrolloff = 10
vim.opt.spell = false

vim.opt.expandtab = true
-- vim.opt.tabstop = 4
-- vim.opt.shiftwidth = 4
-- vim.opt.softtabstop = 4

vim.opt.autoindent = true
vim.opt.smartindent = false
vim.opt.copyindent = true
-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3
