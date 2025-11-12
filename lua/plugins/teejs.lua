return {
	"Wansmer/treesj",
	keys = { "<space>k" },
	dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
	config = function()
		require("treesj").setup({ use_default_keymaps = false })
		vim.keymap.set("n", "<leader>k", require("treesj").toggle, { desc = "Open bracket" })
	end,
}
