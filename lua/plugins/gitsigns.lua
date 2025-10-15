return {
	"lewis6991/gitsigns.nvim",
	event = "VeryLazy",
	config = function()
		require("gitsigns").setup({
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end)

				map("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end)

				-- Actions

				map("n", "<leader>ms", gitsigns.stage_hunk, { desc = "Stage Hunk" })
				map("n", "<leader>mr", gitsigns.reset_hunk, { desc = "Reset Hunk" })

				map("v", "<leader>ms", function()
					gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Stage Selected Hunk" })

				map("v", "<leader>mr", function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Reset Selected Hunk" })

				map("n", "<leader>mS", gitsigns.stage_buffer, { desc = "Stage Buffer" })
				map("n", "<leader>mR", gitsigns.reset_buffer, { desc = "Reset Buffer" })
				map("n", "<leader>mp", gitsigns.preview_hunk, { desc = "Preview Hunk" })
				map("n", "<leader>mi", gitsigns.preview_hunk_inline, { desc = "Inline Hunk Preview" })

				map("n", "<leader>mb", function()
					gitsigns.blame_line({ full = true })
				end, { desc = "Blame Line (Full)" })

				map("n", "<leader>md", gitsigns.diffthis, { desc = "Diff This File" })

				map("n", "<leader>mD", function()
					gitsigns.diffthis("~")
				end, { desc = "Diff This File vs HEAD~" })

				map("n", "<leader>mQ", function()
					gitsigns.setqflist("all")
				end, { desc = "Set QF List (All Hunks)" })

				map("n", "<leader>mq", gitsigns.setqflist, { desc = "Set QF List (Current Hunks)" })

				-- Toggles
				map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle Current Line Blame" })
				map("n", "<leader>tw", gitsigns.toggle_word_diff, { desc = "Toggle Word Diff" })

				-- Text object
				map({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "Inner Hunk Text Object" })
			end,
		})
	end,
}
