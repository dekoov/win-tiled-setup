return {
  "folke/snacks.nvim",
  opts = {
    terminal = {
      win = {
        height = math.floor(vim.o.lines * 0.3), -- altura del terminal como porcentaje de la altura de la ventana
      },
    },
    explorer = {
      replace_netrw = true, -- esto habilita Snacks Explorer al abrir carpetas
    },
    picker = {
      hidden = true,
      ignore = true,
      sources = {
        files = {
          hidden = true,
          ignore = true,
        },
        explorer = {
          layout = {
            preset = "sidebar", -- usar layout lateral
            layout = {
              width = 30, -- ancho fijo en columnas
              height = 1, -- ocupa toda la altura
              position = "left", -- aparece a la izquierda
            },
          },
        },
      },
    },
  },
}
