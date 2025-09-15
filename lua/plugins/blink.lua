return{
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },

  version = '1.*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
 
  opts = {
        keymap = {  preset = "enter",
      ["<C-y>"] = { "select_and_accept" },},

    appearance = {
    use_nvim_cmp_as_default = false,
      nerd_font_variant = 'mono'
    },
    -- experimental signature help support
    signature = { enabled = true },

    completion = { documentation = { auto_show = true} },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}
