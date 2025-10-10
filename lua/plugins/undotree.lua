return {
	"mbbill/undotree",
	cmd = "UndotreeToggle", -- only load when you call the command
	keys = {
		-- { "<leader>ii", "<cmd>UndotreeToggle<CR>", desc = "Toggle UndoTree" },
		{
			"<leader>ii",
			function()
				vim.cmd("UndotreeToggle")
				vim.cmd("wincmd w")
			end,
			desc = "Toggle UndoTree",
		},

		-- { "<leader>if", "<cmd>UndotreeFocus<CR>", desc = "Focus UndoTree" },
	},
}
