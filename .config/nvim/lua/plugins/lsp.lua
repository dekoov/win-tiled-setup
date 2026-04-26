return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {
          settings = {
            intelephense = {
              diagnostics = {
                enable = false,
                undefinedMethod = "warning",
              },
              stubs = {
                "bcmath",
                "bz2",
                "calendar",
                "Core",
                "curl",
                "date",
                "dba",
                "dom",
                "enchant",
                "fileinfo",
                "filter",
                "ftp",
                "gd",
                "gettext",
                "hash",
                "iconv",
                "imap",
                "intl",
                "json",
                "ldap",
                "libxml",
                "mbstring",
                "mcrypt",
                "mysql",
                "mysqli",
                "password",
                "pcntl",
                "pcre",
                "PDO",
                "pdo_mysql",
                "Phar",
                "readline",
                "recode",
                "Reflection",
                "regex",
                "session",
                "SimpleXML",
                "soap",
                "sockets",
                "sodium",
                "SPL",
                "standard",
                "superglobals",
                "sysvsem",
                "sysvshm",
                "tokenizer",
                "xml",
                "xdebug",
                "xmlreader",
                "xmlwriter",
                "yaml",
                "zip",
                "zlib",
                -- Stubs importantes para Laravel / WordPress
                "wordpress",
                "phpunit",
                "laravel",
              },
              files = {
                maxSize = 5000000, -- Aumenta el límite de tamaño de archivo a 5MB
              },
              environment = {
                includePaths = { vim.fn.expand("~/.composer/vendor/php-stubs/") },
              },
            },
          },
        },
        -- Mantén laravel_ls desactivado o con rename false como lo tenías antes
        laravel_ls = {
          enabled = false, -- O tu config anterior para desactivar rename
        },
      },
    },
  },
}
