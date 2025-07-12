require "nvchad.autocmds"

vim.api.nvim_create_user_command("SaveSession", function()
  vim.cmd("mksession! ~/AppData/Local/nvim/sessions/work1.vim")
end, {})

vim.api.nvim_create_user_command("LoadSession", function()
  vim.cmd("source ~/AppData/Local/nvim/sessions/work1.vim")
end, {})
