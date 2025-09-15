
return {
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",

    opts = {
      keymap = {
        preset = "enter",
        ["<C-y>"] = { "select_and_accept" },
      },

      appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "mono",
      },

      signature = { enabled = true },

      completion = {
        list = { selection = { preselect = true, auto_insert = false } },
        trigger = { show_on_insert = true },
        accept = { auto_brackets = { enabled = true } },
        menu = {
        scrollbar = false,
          border = "rounded",
          auto_show = true,
          auto_show_delay_ms = 0,
          draw = { treesitter = { "lsp" } },
        },
        documentation = {
          window = {
            min_width = 10,
            max_width = 80,
            max_height = 20,
            border = "rounded",
          },
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        ghost_text = { enabled = vim.g.ai_cmp },
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },

      fuzzy = { implementation = "prefer_rust_with_warning" },
    },

    opts_extend = { "sources.default" },
  },
}
-- return{
--   'saghen/blink.cmp',
--   dependencies = { 'rafamadriz/friendly-snippets' },
--
--   version = '1.*',
--
--   ---@module 'blink.cmp'
--   ---@type blink.cmp.Config
--
--   opts = {
--         keymap = {  preset = "enter",
--       ["<C-y>"] = { "select_and_accept" },},
--
--     appearance = {
--     use_nvim_cmp_as_default = false,
--       nerd_font_variant = 'mono'
--     },
--     -- experimental signature help support
--     signature = { enabled = true },
--
--     -- completion = { documentation = { auto_show = true} },
--     completion = {
--         trigger = {
--   show_on_insert = false,
--         },
--       accept = {
--         -- experimental auto-brackets support
--         auto_brackets = {
--           enabled = true,
--         },
--       },
--       menu = {
--       border = "rounded",
--       auto_show = true,
--       auto_show_delay_ms = 0,
--         draw = {
--           treesitter = { "lsp" },
--         },
--       },
--       documentation = {
--  window = {
--     min_width = 10,
--     max_width = 80,
--     max_height = 20,
--     border = "rounded",},
--         auto_show = true,
--         auto_show_delay_ms = 200,
--       },
--       ghost_text = {
--         enabled = vim.g.ai_cmp,
--       },
--     },
--
--     sources = {
--       compat = {},
--       default = { 'lsp', 'path', 'snippets', 'buffer' },
--     },
--
--     fuzzy = { implementation = "prefer_rust_with_warning" }
--   },
--   opts_extend = { "sources.default" }
-- }
--
