return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"folke/lazydev.nvim", -- add lazydev
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
				html = {}, -- HTML
				cssls = {}, -- CSS
				pyright = {}, -- Python
				clangd = {}, -- C/C++
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
				float = { border = "rounded", source = "if_many", focusable = false },
				underline = true,
				update_in_insert = false,
				virtual_text = { spacing = 4, source = "if_many", prefix = "●" },
				severity_sort = true,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "",
						[vim.diagnostic.severity.WARN] = "",
						[vim.diagnostic.severity.HINT] = "",
						[vim.diagnostic.severity.INFO] = "",
					},
				},
			})
		end,
	},
}
