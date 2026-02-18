-- bootstrap lazy.nvim, LazyVim and your plugins

-- init.lua para VSCode Neovim
-- Coloca este archivo en: ~/.config/nvim/init.lua (Linux/Mac) o ~/AppData/Local/nvim/init.lua (Windows)

local map = vim.keymap.set

-- Detectar si estamos en VSCode
if vim.g.vscode then
  vim.opt.clipboard = "unnamedplus"
  map("n", "<leader>fb", function()
    vscode.action("workbench.action.showAllEditors")
  end, { desc = "Find Buffers" })

  -- Git
  map("n", "<leader>gg", function()
    vscode.action("workbench.view.scm")
  end, { desc = "Git" })
  map("n", "<leader>gb", function()
    vscode.action("gitlens.toggleLineBlame")
  end, { desc = "Git Blame Line" })

  -- Terminal
  map("n", "<leader>ft", function()
    vscode.action("workbench.action.terminal.toggleTerminal")
  end, { desc = "Terminal" })
  map({ "n", "t" }, "<c-/>", function()
    vscode.action("workbench.action.terminal.toggleTerminal")
  end, { desc = "Terminal" })
  map({ "n", "t" }, "<c-_>", function()
    vscode.action("workbench.action.terminal.toggleTerminal")
  end, { desc = "Terminal" })

  -- Split windows
  map("n", "<leader>-", function()
    vscode.action("workbench.action.splitEditorDown")
  end, { desc = "Split Window Below" })
  map("n", "<leader>|", function()
    vscode.action("workbench.action.splitEditorRight")
  end, { desc = "Split Window Right" })
  map("n", "<leader>wd", function()
    vscode.action("workbench.action.closeActiveEditor")
  end, { desc = "Delete Window" })

  -- Commenting (VSCode tiene su propio sistema)
  map("n", "gcc", function()
    vscode.action("editor.action.commentLine")
  end, { desc = "Toggle Comment" })
  map("x", "gc", function()
    vscode.action("editor.action.commentLine")
  end, { desc = "Toggle Comment" })

  -- Quickfix/Problems
  map("n", "<leader>xq", function()
    vscode.action("workbench.actions.view.problems")
  end, { desc = "Problems" })
  map("n", "]q", function()
    vscode.action("search.action.focusNextSearchResult")
  end, { desc = "Next Quickfix" })
  map("n", "[q", function()
    vscode.action("search.action.focusPreviousSearchResult")
  end, { desc = "Previous Quickfix" })

  -- Fold
  map("n", "za", function()
    vscode.action("editor.toggleFold")
  end, { desc = "Toggle Fold" })
  map("n", "zM", function()
    vscode.action("editor.foldAll")
  end, { desc = "Fold All" })
  map("n", "zR", function()
    vscode.action("editor.unfoldAll")
  end, { desc = "Unfold All" })

  -- Tabs
  map("n", "<leader><tab>]", function()
    vscode.action("workbench.action.nextEditorInGroup")
  end, { desc = "Next Tab" })
  map("n", "<leader><tab>[", function()
    vscode.action("workbench.action.previousEditorInGroup")
  end, { desc = "Previous Tab" })
  map("n", "<leader><tab>d", function()
    vscode.action("workbench.action.closeActiveEditor")
  end, { desc = "Close Tab" })

  -- ============================================
  -- KEYMAPS PARA NEOVIM NORMAL (sin VSCode)
  -- ============================================
  -- Aquí puedes poner tu configuración normal de LazyVim
  -- o dejar vacío si solo usas VSCode
  -- KEYMAPS QUE FUNCIONAN EN VSCODE
  -- ============================================

  -- Better up/down (navegación visual)
  map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
  map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
  map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
  map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

  -- Better indenting
  map("x", "<", "<gv")
  map("x", ">", ">gv")

  -- Add undo break-points
  map("i", ",", ",<c-g>u")
  map("i", ".", ".<c-g>u")
  map("i", ";", ";<c-g>u")

  -- Clear search highlighting
  map("n", "<Esc>", "<cmd>noh<cr><esc>", { desc = "Clear search highlight" })

  -- Better search (mantener centrado)
  map("n", "n", "nzzzv", { desc = "Next search result" })
  map("n", "N", "Nzzzv", { desc = "Prev search result" })

  -- VSCode specific commands usando <Cmd>call
  local vscode = require("vscode-neovim")

  -- Window navigation (delegado a VSCode)
  map("n", "<C-h>", function()
    vscode.action("workbench.action.navigateLeft")
  end)
  map("n", "<C-j>", function()
    vscode.action("workbench.action.navigateDown")
  end)
  map("n", "<C-k>", function()
    vscode.action("workbench.action.navigateUp")
  end)
  map("n", "<C-l>", function()
    vscode.action("workbench.action.navigateRight")
  end)

  -- Buffer/Tab navigation
  map("n", "<S-h>", function()
    vscode.action("workbench.action.previousEditor")
  end)
  map("n", "<S-l>", function()
    vscode.action("workbench.action.nextEditor")
  end)
  map("n", "[b", function()
    vscode.action("workbench.action.previousEditor")
  end)
  map("n", "]b", function()
    vscode.action("workbench.action.nextEditor")
  end)

  -- Leader keymaps (usando leader key, por defecto espacio)
  vim.g.mapleader = " "
  vim.g.maplocalleader = "\\"

  -- Buffer operations
  map("n", "<leader>bd", function()
    vscode.action("workbench.action.closeActiveEditor")
  end, { desc = "Delete Buffer" })
  map("n", "<leader>bo", function()
    vscode.action("workbench.action.closeOtherEditors")
  end, { desc = "Delete Other Buffers" })
  map("n", "<leader>bb", function()
    vscode.action("workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup")
  end, { desc = "Switch to Other Buffer" })

  -- File operations
  map("n", "<leader>w", function()
    vscode.action("workbench.action.files.save")
  end, { desc = "Save File" })
  map({ "i", "x", "n", "s" }, "<C-s>", function()
    vscode.action("workbench.action.files.save")
  end, { desc = "Save File" })

  -- Formatting
  map({ "n", "x" }, "<leader>cf", function()
    vscode.action("editor.action.formatDocument")
  end, { desc = "Format" })

  -- Code actions
  map("n", "<leader>ca", function()
    vscode.action("editor.action.quickFix")
  end, { desc = "Code Action" })
  map("n", "<leader>cr", function()
    vscode.action("editor.action.rename")
  end, { desc = "Rename" })

  -- Diagnostics
  map("n", "<leader>cd", function()
    vscode.action("editor.action.showHover")
  end, { desc = "Line Diagnostics" })
  map("n", "]d", function()
    vscode.action("editor.action.marker.next")
  end, { desc = "Next Diagnostic" })
  map("n", "[d", function()
    vscode.action("editor.action.marker.prev")
  end, { desc = "Prev Diagnostic" })
  map("n", "]e", function()
    vscode.action("editor.action.marker.nextInFiles")
  end, { desc = "Next Error" })
  map("n", "[e", function()
    vscode.action("editor.action.marker.prevInFiles")
  end, { desc = "Prev Error" })

  -- Search
  map("n", "<leader>ff", function()
    vscode.action("workbench.action.quickOpen")
  end, { desc = "Find Files" })
  map("n", "<leader>fg", function()
    vscode.action("workbench.action.findInFiles")
  end, { desc = "Find in Files" })
  map("n", "<leader>fb", function()
    vscode.action("workbench.action.showAllEditors")
  end, { desc = "Find Buffers" })

  -- Git
  map("n", "<leader>gg", function()
    vscode.action("workbench.view.scm")
  end, { desc = "Git" })
  map("n", "<leader>gb", function()
    vscode.action("gitlens.toggleLineBlame")
  end, { desc = "Git Blame Line" })

  -- Terminal
  map("n", "<leader>ft", function()
    vscode.action("workbench.action.terminal.toggleTerminal")
  end, { desc = "Terminal" })
  map({ "n", "t" }, "<c-/>", function()
    vscode.action("workbench.action.terminal.toggleTerminal")
  end, { desc = "Terminal" })
  map({ "n", "t" }, "<c-_>", function()
    vscode.action("workbench.action.terminal.toggleTerminal")
  end, { desc = "Terminal" })

  -- Split windows
  map("n", "<leader>-", function()
    vscode.action("workbench.action.splitEditorDown")
  end, { desc = "Split Window Below" })
  map("n", "<leader>|", function()
    vscode.action("workbench.action.splitEditorRight")
  end, { desc = "Split Window Right" })
  map("n", "<leader>wd", function()
    vscode.action("workbench.action.closeActiveEditor")
  end, { desc = "Delete Window" })

  -- Commenting (VSCode tiene su propio sistema)
  map("n", "gcc", function()
    vscode.action("editor.action.commentLine")
  end, { desc = "Toggle Comment" })
  map("x", "gc", function()
    vscode.action("editor.action.commentLine")
  end, { desc = "Toggle Comment" })

  -- Quickfix/Problems
  map("n", "<leader>xq", function()
    vscode.action("workbench.actions.view.problems")
  end, { desc = "Problems" })
  map("n", "]q", function()
    vscode.action("search.action.focusNextSearchResult")
  end, { desc = "Next Quickfix" })
  map("n", "[q", function()
    vscode.action("search.action.focusPreviousSearchResult")
  end, { desc = "Previous Quickfix" })

  -- Fold
  map("n", "za", function()
    vscode.action("editor.toggleFold")
  end, { desc = "Toggle Fold" })
  map("n", "zM", function()
    vscode.action("editor.foldAll")
  end, { desc = "Fold All" })
  map("n", "zR", function()
    vscode.action("editor.unfoldAll")
  end, { desc = "Unfold All" })

  -- Tabs
  map("n", "<leader><tab>]", function()
    vscode.action("workbench.action.nextEditorInGroup")
  end, { desc = "Next Tab" })
  map("n", "<leader><tab>[", function()
    vscode.action("workbench.action.previousEditorInGroup")
  end, { desc = "Previous Tab" })
  map("n", "<leader><tab>d", function()
    vscode.action("workbench.action.closeActiveEditor")
  end, { desc = "Close Tab" })
else
  require("config.lazy")
  -------------------------------------------------------------------------------
  -- Configuración de VimTeX para SumatraPDF
  -------------------------------------------------------------------------------

  -- 1. Establecer el visor a SumatraPDF
  vim.g.vimtex_view_method = "general" -- Sumatra se maneja como visor general en Neovim
  vim.g.vimtex_view_general_viewer = "SumatraPDF"

  -- 2. Opciones para búsqueda inversa y refresco automático
  vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"

  -- 3. Configurar el motor de compilación (latexmk es el default)
  -- No es estrictamente necesario declararlo porque es el valor por defecto,
  -- pero ponerlo ayuda a asegurar que use la configuración correcta.
  vim.g.vimtex_compiler_method = "latexmk"

  -- 4. Opciones específicas para latexmk (opcional)
  -- Esto permite, por ejemplo, que no se detenga por errores menores
  vim.g.vimtex_compiler_latexmk = {
    options = {
      "-shell-escape",
      "-verbose",
      "-file-line-error",
      "-synctex=1",
      "-interaction=nonstopmode",
    },
  }
end
