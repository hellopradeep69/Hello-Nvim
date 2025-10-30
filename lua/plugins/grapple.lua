return {
	"cbochs/grapple.nvim",
	lazy = false,
	opts = {
		scope = "cwd",
		icons = false, -- setting to "true" requires "nvim-web-devicons"
		status = true,

		-- quick_select = "qwertyuio",
		quick_select = "1234567890",
		GrappleTitle = false,
		default_scopes = {
			lsp = { hidden = true },
			git_branch = { hidden = true },
			git = { hidden = true },
			static = { hidden = true },
		},
		win_opts = {

			width = 75,
			height = 8,
			row = 0.5,
			col = 0.5,

			relative = "editor",
			border = "single",
			focusable = false,
			style = "minimal",

			title = "Grapple", -- fallback title for Grapple windows
			title_pos = "left",
			title_padding = " ",

			footer = "",
		},
	},

	keys = {
		-- { "<leader>H", "<cmd>Grapple toggle<cr>", desc = "Tag a file" },
		-- { "<c-h>", "<cmd>Grapple toggle<cr>", desc = "Tag a file" },
		{
			"<leader>H",
			function()
				vim.cmd("Grapple tag")
				Snacks.notify.info("Grapple: Added")
			end,
			desc = "Tag a file",
		},

		{ "<leader>h", "<cmd>Grapple toggle_tags<cr>", desc = "Toggle tags menu" },

		{ "<leader>j", "<cmd>Grapple cycle_scopes next<cr>", desc = "cycle scopes" },
		{ "<c-j>", "<cmd>Grapple cycle_tags next<cr>", desc = "Go to next tag" },
		{ "<c-k>", "<cmd>Grapple cycle_tags prev<cr>", desc = "Go to previous tag" },
	},
}
