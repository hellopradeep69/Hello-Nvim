return {
	"rmagatti/auto-session",
	lazy = false,

	opts = {
		--- saving/restoring
		auto_save = true,
		auto_restore = false,
		cwd_change_handling = true,
		auto_create = false,
		--- suppressed/allowed
		suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
		session_lens = {
			picker = "snacks",
			picker_opts = {
				preset = "dropdown",
				-- preset = "vscode",
				preview = true,
				layout = {
					width = 0.4,
					height = 0.4,
				},
			},
		},
	},
	keys = {
		{
			"<leader>sa",
			":AutoSession save ",
			desc = "AutoSession save",
		},
		{
			"<leader>sl",
			"<CMD>AutoSession search<CR>",
			desc = "AutoSession Picker",
		},
		{
			"<leader>sx",
			"<CMD>AutoSession deletePicker<CR>",
			desc = "AutoSession Delete",
		},
	},
}
