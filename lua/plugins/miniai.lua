return {
	"nvim-mini/mini.ai",
	event = "VeryLazy",
	config = function()
		local ai = require("mini.ai")
		require("mini.ai").setup({
			n_lines = 100,
			custom_textobjects = {

				-- Function definition (needs treesitter queries with these captures)
				F = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
				o = ai.gen_spec.treesitter({
					a = { "@block.outer", "@conditional.outer", "@loop.outer" },
					i = { "@block.inner", "@conditional.inner", "@loop.inner" },
				}),

				-- Whole buffer
				g = function()
					local from = { line = 1, col = 1 }
					local to = {
						line = vim.fn.line("$"),
						col = math.max(vim.fn.getline("$"):len(), 1),
					}
					return { from = from, to = to }
				end,

				-- function call
				u = ai.gen_spec.function_call(),
				U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }),

				-- classic class stuff
				c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),

				-- tag
				t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
				d = { "%f[%d]%d+" },
			},
		})
	end,
}
