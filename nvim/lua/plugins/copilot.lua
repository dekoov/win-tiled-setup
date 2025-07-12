return {
  {
    "github/copilot.vim",
    event = "InsertEnter",

    config = function()
      -- Desactiva el uso de <Tab> para que no interfiera con cmp o luasnip
      vim.g.copilot_no_tab_map = true

      -- Mapea Ctrl + J para aceptar sugerencias de Copilot
      vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', {
        expr = true,
        silent = true,
        noremap = true,
        script = true,
      })
    end,
  },
}
