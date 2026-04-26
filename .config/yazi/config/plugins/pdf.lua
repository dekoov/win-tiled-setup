-- pdf.lua

local function main()
    -- Ruta completa del archivo PDF que se está previsualizando
    local file = os.getenv("PREVIEW_TARGET")

    -- Ruta temporal para guardar la imagen
    local tmp = os.getenv("TEMP") or "C:\\Windows\\Temp"
    local out = tmp .. "\\preview"

    -- Ruta completa a pdftoppm (adaptada a tu sistema)
    local pdftoppm = os.getenv("USERPROFILE") .. "\\scoop\\apps\\poppler\\current\\bin\\pdftoppm.exe"

    local width = tonumber(os.getenv("PREVIEW_WIDTH")) or 80
    local height = tonumber(os.getenv("PREVIEW_HEIGHT")) or 24

    local dpi = math.min(width * 2, height * 4, 150)

    -- Comando: convierte la primera página en PNG
    local cmd = string.format('"%s" -png -f 1 -singlefile -rx 72 -ry 72 "%s" "%s"', pdftoppm, dpi, file, out)
    os.execute(cmd)

    -- Imprime la ruta del archivo como preview de imagen
    print("image://" .. out .. ".png")
end

main()

