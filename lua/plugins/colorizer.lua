return {
	"catgoose/nvim-colorizer.lua",
	event = "BufReadPre",
	opts = {
		user_default_options = {
			names = false, -- "Name" codes like Blue or red.  Added from `vim.api.nvim_get_color_map()`
		},
		RRGGBBAA = true, -- #RRGGBBAA hex codes
		AARRGGBB = true, -- 0xAARRGGBB hex codes
		rgb_fn = true, -- CSS rgb() and rgba() functions
		hsl_fn = true, -- CSS hsl() and hsla() functions
		oklch_fn = true, -- CSS oklch() function
		css = true, -- Enable all CSS *features*:
		-- names, RGB, RGBA, RRGGBB, RRGGBBAA, AARRGGBB, rgb_fn, hsl_fn, oklch_fn
		css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn, oklch_fn
		-- Tailwind colors.  boolean|'normal'|'lsp'|'both'.  True sets to 'normal'
		tailwind = true,
	},
}

-- return {
-- 	"norcalli/nvim-colorizer.lua",
-- 	config = function()
-- 		require("colorizer").setup({ "*" }, {
-- 			RGB = true, -- #RGB hex codes
-- 			RRGGBB = true, -- #RRGGBB hex codes
-- 			names = false, -- "Name" codes like Blue
-- 			RRGGBBAA = true, -- #RRGGBBAA hex codes
-- 			rgb_fn = true, -- CSS rgb() and rgba() functions
-- 			hsl_fn = true, -- CSS hsl() and hsla() functions
-- 			css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
-- 			css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
-- 		})
-- 	end,
-- }
