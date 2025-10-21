return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {
          -- ... otras configuraciones
          settings = {
            intelephense = {
              -- Esto a menudo desactiva las verificaciones de estilo/formato
              environment = {
                includePaths = { "/vendor/" }, -- Ajusta según tu proyecto
              },
              files = {
                maxSize = 5000000,
              },
              diagnostics = {
                -- Desactiva completamente los diagnósticos (si es necesario)
                -- enable = false,
                -- Pero Intelephense no tiene una opción granular para esa regla específica
                -- por lo que si el error persiste, la solución es la Opción 2.
              },
              -- Desactiva el formateador interno de Intelephense
              format = {
                enable = false,
              },
              -- ... otras configuraciones si estás en Laravel/Symfony (includePaths)
            },
          },
        },
      },
    },
  },
}
