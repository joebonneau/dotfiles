return {
  "neovim/nvim-lspconfig",
  -- config = function()
  --   local lspconfig = require("lspconfig")
  -- lspconfig.htmx.setup({
  --   filetypes = { "htmldjango" },
  -- })
  -- lspconfig.emmet_language_server.setup({
  --   filetypes = { "astro", "gotmpl", "go", "html", "htmldjango", "javascriptreact", "typescriptreact" },
  -- })
  -- lspconfig.pyright.setup({
  --   filetypes = { "python" },
  -- })
  -- lspconfig.tailwindcss.setup({
  --   filetypes = {
  --     "aspnetcorerazor",
  --     "astro",
  --     "astro-markdown",
  --     "blade",
  --     "clojure",
  --     "django-html",
  --     "htmldjango",
  --     "edge",
  --     "eelixir",
  --     "elixir",
  --     "ejs",
  --     "erb",
  --     "eruby",
  --     "gohtml",
  --     "gohtmltmpl",
  --     "haml",
  --     "handlebars",
  --     "hbs",
  --     "html",
  --     "html-eex",
  --     "heex",
  --     "jade",
  --     "leaf",
  --     "liquid",
  --     "markdown",
  --     "mdx",
  --     "mustache",
  --     "njk",
  --     "nunjucks",
  --     "php",
  --     "razor",
  --     "slim",
  --     "twig",
  --     "css",
  --     "less",
  --     "postcss",
  --     "sass",
  --     "scss",
  --     "stylus",
  --     "sugarss",
  --     "javascript",
  --     "javascriptreact",
  --     "reason",
  --     "rescript",
  --     "typescript",
  --     "typescriptreact",
  --     "vue",
  --     "svelte",
  --     "templ",
  --     "python",
  --   },
  --   })
  -- end,
  opts = {
    format = { timeout_ms = 1000 },
    servers = {
      emmet_language_server = {
        filetypes = { "astro", "gotmpl", "go", "html", "htmldjango", "javascriptreact", "typescriptreact" },
      },
      htmx = { filetypes = { "htmldjango" } },
      pyright = {},
    },
  },
}
