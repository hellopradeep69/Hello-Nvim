return {
  "williamboman/mason.nvim",
  lazy = false, -- load immediately
  keys = {
    { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" },
  },
  opts = {
    ensure_installed = { "stylua", "shfmt" }, -- tools you want
  },
  config = function(_, opts)
    local mason = require("mason")
    local mr = require("mason-registry")

    -- Setup mason with your options
    mason.setup(opts)

    -- Automatically install tools in ensure_installed
    mr.refresh(function()
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end)

    -- Optional: trigger FileType to reload LSP/formatting if tool installed
    mr:on("package:install:success", function()
      vim.defer_fn(function()
        vim.cmd("doautocmd FileType")
      end, 100)
    end)
  end,
}
--
-- return{
--   "williamboman/mason.nvim",
--   lazy = false,  -- or false if you want it loaded immediately
--  cmd = "Mason", -- either one
--  build = ":MasonUpdate",
--   config = function()
--     require("mason").setup()
--   end,
-- }


