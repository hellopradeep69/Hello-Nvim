
return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },

    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = { checkThirdParty = false },
              completion = { callSnippet = "Replace" },
            },
          },
        },
        html = {},     -- HTML
        cssls = {},    -- CSS
        pyright = {},  -- Python
        clangd = {},   -- C/C++
      },
    },

    config = function(_, opts)
      local lspconfig = require("lspconfig")
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- Setup mason
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(opts.servers),
        automatic_installation = true,
      })

      -- Loop through servers manually (works even without setup_handlers)
      for server, server_opts in pairs(opts.servers) do
        server_opts.capabilities = capabilities
        lspconfig[server].setup(server_opts)
      end

      -- Diagnostics look
      vim.diagnostic.config({
        float = { border = "rounded", source = "always", focusable = false },
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, source = "if_many", prefix = "●" },
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN]  = "",
            [vim.diagnostic.severity.HINT]  = "",
            [vim.diagnostic.severity.INFO]  = "",
          },
        },
      })
    end,
  },
}
--
-- return {
--   'neovim/nvim-lspconfig',
--   dependencies = { 'saghen/blink.cmp' },
--
--   -- example using `opts` for defining servers
--   opts = {
--     servers = {
--       lua_ls = {}
--     },
--       -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
--       -- Be aware that you also will need to properly configure your LSP server to
--       -- provide the inlay hints.
--       inlay_hints = {
--         enabled = true,
--         exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
--       },
--       -- Enable this to enable the builtin LSP code lenses on Neovim >= 0.10.0
--       -- Be aware that you also will need to properly configure your LSP server to
--       -- provide the code lenses.
--       codelens = {
--         enabled = false,
--       },
--   },
--
--   config = function(_, opts)
--     local lspconfig = require('lspconfig')
--     local capabilities = require('blink.cmp').get_lsp_capabilities()
--
--     -- ===== Diagnostics setup =====
--     vim.diagnostic.config({
--       float = {
--       border = "rounded", -- "single", "double", "rounded", "shadow", etc.
--       source = "always",  -- always show the source of the diagnostic
--       focusable = false,
--       },
--       underline = true,
--       update_in_insert = false,
--       virtual_text = {
--         spacing = 4,
--         source = "if_many",
--         prefix = "●",
--         -- prefix = "icons", -- requires recent Neovim 0.10+
--       },
--       severity_sort = true,
--       signs = {
--         text = {
--       [vim.diagnostic.severity.ERROR] = "",
--       [vim.diagnostic.severity.WARN]  = "",
--       [vim.diagnostic.severity.HINT]  = "",
--       [vim.diagnostic.severity.INFO]  = "",
--         },
--       },
--     })
--
--     -- Setup servers defined in opts
--     for server, config in pairs(opts.servers) do
--       config.capabilities = capabilities
--       lspconfig[server].setup(config)
--     end
--
--     -- Direct setup for lua_ls if you want extra customization
--     lspconfig['lua_ls'].setup({ capabilities = capabilities })
--   end
-- }
