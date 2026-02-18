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

-- Mapea <leader>rn (rename) para renombrar la variable bajo el cursor
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Renombrar símbolo" })

-- vim.keymap.set("n", "<leader>cj", function()
--   vim.cmd("write") -- Guarda el archivo actual
--   vim.cmd("!mvn exec:java -Dexec.mainClass='espe.dc.Main'")
-- end, { desc = "Ejecutar Proyecto Java con Maven" })

vim.keymap.set("n", "<leader>rj", function()
  vim.cmd("write")

  -- 1. Obtener el nombre completo de la clase
  local class_name = vim.fn.expand("%:t:r")
  local package = ""
  local lines = vim.api.nvim_buf_get_lines(0, 0, 10, false)
  for _, line in ipairs(lines) do
    local match = line:match("^package%s+(.-);")
    if match then
      package = match .. "."
      break
    end
  end
  local full_name = package .. class_name

  -- 2. Crear un buffer para la terminal en un split inferior
  vim.cmd("split")
  vim.cmd("resize 15") -- Ajusta el tamaño a 15 líneas

  -- 3. Ejecutar usando termopen (mejor para PowerShell)
  -- Usamos un array de strings para evitar líos de comillas
  local cmd = { "mvn", "compile", "exec:java", "-Dexec.mainClass=" .. full_name }

  vim.fn.termopen(cmd)

  -- 4. Entrar en modo insertar automáticamente
  vim.cmd("startinsert")
end, { desc = "Ejecutar Java con Maven en PowerShell" })
