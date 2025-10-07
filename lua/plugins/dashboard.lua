return {
	"nvimdev/dashboard-nvim",
	lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
	opts = function()
		local logo = [[

     $$\   $$\           $$\ $$\           
     $$ |  $$ |          $$ |$$ |          
     $$ |  $$ | $$$$$$\  $$ |$$ | $$$$$$\  
     $$$$$$$$ |$$  __$$\ $$ |$$ |$$  __$$\ 
     $$  __$$ |$$$$$$$$ |$$ |$$ |$$ /  $$ |
     $$ |  $$ |$$   ____|$$ |$$ |$$ |  $$ |
     $$ |  $$ |\$$$$$$$\ $$ |$$ |\$$$$$$  |
     \__|  \__| \_______|\__|\__| \______/ 

    ]]

		local snacks = require("snacks") -- make sure snacks.nvim is installed
		-- logo = string.rep("\n", 8) .. logo .. "\n"
		local vim = vim
		local opts = {
			theme = "doom",
			hide = {
				-- this is taken care of by lualine
				-- enabling this messes up the actual laststatus setting after loading a file
				statusline = true,
			},
			config = {
				header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
          { action = function() snacks.picker.files() end,                desc = " Find File",       key = "f" },
          { action = "ene | startinsert",                                 desc = " New File",        key = "n" },
          { action = function() snacks.picker.recent() end,               desc = " Recent Files",    key = "r" },
          { action = function() snacks.picker.grep() end,                 desc = " Find Text",       key = "g" },
          { action = function() snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end,       desc = " Config",          key = "c" },
          { action = "Lazy update",                                    desc = " Lazy Update",       key = "u" },
          { action = "Lazy",                                           desc = " Lazy",            key = "l" },
          { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            key = "q" },
        },
				-- footer = function()
				footer = {},
				--   local stats = require("lazy").stats()
				--   local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				--   return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
				-- end,
				--
				-- footer = {
				--   " Hellopradeep 💌 ",
				-- },
			},
		}

		for _, button in ipairs(opts.config.center) do
			button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
			button.key_format = "  %s"
		end

		-- open dashboard after closing lazy
		if vim.o.filetype == "lazy" then
			vim.api.nvim_create_autocmd("WinClosed", {
				pattern = tostring(vim.api.nvim_get_current_win()),
				once = true,
				callback = function()
					vim.schedule(function()
						vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
					end)
				end,
			})
		end

		return opts
	end,
}
