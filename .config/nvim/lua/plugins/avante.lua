return {
  "yetone/avante.nvim",
  opts = {
    -- 1. Comportamiento (lo tenías bien)
    behaviour = {
      auto_suggestions = false,
      enable_cursor_planning_mode = false,
    },

    -- 2. Definimos que usaremos un proveedor personalizado llamado "mis_geminis"
    provider = "gemini",

    -- 3. Aquí definimos la configuración técnica
    providers = {
      gemini = {
        endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
        model = "gemini-2.5-flash", -- Este es el modelo real y rápido
        timeout = 30000,

        -- IMPORTANTE:
        -- Aquí va el NOMBRE de la variable de entorno, NO la clave.
        -- Debes crear una variable en Windows llamada GEMINI_API_KEY con tu clave nueva.
        api_key_name = "GEMINI_API_KEY",
      },
    },
  },
}
