-- use `vim.keymap.set` instead
local vim = vim
local Snacks = Snacks

local map = vim.keymap.set

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

map("n", "<leader>dd", function()
	Snacks.bufdelete()
end, { desc = "Delete Buffer" })
map("n", "<leader>bo", function()
	Snacks.bufdelete.other()
end, { desc = "Delete Other Buffers" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- better indenting | okie i agree folke
map("v", "<", "<gv")
map("v", ">", ">gv")

-- commenting
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

-- diagnostic
local diagnostic_goto = function(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity })
	end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- stylua: ignore start
-- toggle options
Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
Snacks.toggle.diagnostics():map("<leader>ud")
Snacks.toggle.line_number():map("<leader>ul")
Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2, name = "Conceal Level" }):map("<leader>uc")
-- Snacks.toggle.option("background", { off = "light", on = "dark" , name = "Dark Background" }):map("<leader>ub")
-- Snacks.toggle.dim():map("<leader>uD")
Snacks.toggle.animate():map("<leader>ua")
Snacks.toggle.indent():map("<leader>ug")
Snacks.toggle.scroll():map("<leader>uS")

if vim.lsp.inlay_hint then
  Snacks.toggle.inlay_hints():map("<leader>uh")
end

-- lazygit
if vim.fn.executable("lazygit") == 1 then
  map("n", "<leader>gg", function() Snacks.lazygit() end, { desc = "Lazygit (cwd)" })
  map("n", "<leader>gf", function() Snacks.picker.git_log_file() end, { desc = "Git Current File History" })
  map("n", "<leader>gl", function() Snacks.picker.git_log() end, { desc = "Git Log (cwd)" })
end

map("n", "<leader>gb", function() Snacks.picker.git_log_line() end, { desc = "Git Blame Line" })
map({ "n", "x" }, "<leader>gB", function() Snacks.gitbrowse() end, { desc = "Git Browse (open)" })
map({"n", "x" }, "<leader>gY", function()
    Snacks.gitbrowse({ open = function(url) vim.fn.setreg("+", url) end, notify = false })
end, { desc = "Git Browse (copy)" })

-- quit
-- map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

map("n", "<leader>o", "<C-w>w", { desc = "toggle Window",noremap = true, silent = false})
map("n", "<leader>qq", "<C-w>qq", { desc = "Quit Window",noremap = true, silent = false})

map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- native snippets. only needed on < 0.11, as 0.11 creates these by default
if vim.fn.has("nvim-0.11") == 0 then
  map("s", "<Tab>", function()
    return vim.snippet.active({ direction = 1 }) and "<cmd>lua vim.snippet.jump(1)<cr>" or "<Tab>"
  end, { expr = true, desc = "Jump Next" })
  map({ "i", "s" }, "<S-Tab>", function()
    return vim.snippet.active({ direction = -1 }) and "<cmd>lua vim.snippet.jump(-1)<cr>" or "<S-Tab>"
  end, { expr = true, desc = "Jump Previous" })
end

-- jj as an escape
vim.keymap.set("i", "jj", "<Esc>", { desc = "jj to escape insert mode" })
vim.o.timeoutlen = 300

-- local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Don't copy to clipboard when deleting
map("n", "d", '"_d', opts)
map("n", "dd", '"_dd', opts)
map("n", "x", '"_x', opts)
map("v", "d", '"_d', opts)
map("v", "x", '"_x', opts)

-- open menu 
-- map("n", "<leader>m", ":Dashboard<CR>", {desc = "Open Menu"})


-- move stuff easily
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<ESC>", ":nohlsearch<CR>", {desc = "clear search highlight"})

-- Normal mode: <leader>sr opens :%s/
vim.keymap.set("n", "<leader>r", ":%s/", { desc = "Search and Replace" })
vim.keymap.set("n", "<leader>ba", ":enew<CR>", { desc = " New Buffer" })

-- vim.api.nvim_set_keymap("n", "<leader>m", ":lua ToggleGrappleStyle()<CR>", { desc = "GRAPPLE STYLE " })

vim.keymap.set("n", "<leader>k", ":Screenkey toggle<CR>", { desc = "KEY show" })

vim.keymap.set("n", "<leader>a", ":Lazy reload grapple.nvim<CR>", opts)

vim.keymap.set("n", "<leader>R", ":sil ! ~/.local/bin/topen.sh code %<CR>", {desc = "Debug", silent = true})

-- vim.keymap.set("n", "<leader>sl", function ()
-- vim.cmd("AutoSession search")
-- vim.cmd("stopinsert")
-- end, { desc = "AutoSession Picker", })

-- vim.keymap.set("n", "<leader>R", function ()
--     vim.cmd("write")
-- vim.cmd(":sil ! ~/.local/bin/topen.sh code %")
-- end, {desc = "Code runner", silent = true})

-- vim.keymap.set("n", "<leader>R", function ()
--    local file = vim.api.nvim_buf_get_name(0)
--     vim.cmd("! ~/.local/bin/debug " .. file)
--     vim.cmd("startinsert")
-- end, { desc = "Code Runner" })

-- vim.keymap.set("n", "<leader>R", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]])

-- vim.keymap.set("c", "jj", "<Esc>", { desc = "Abort command-line" })
-- vim.keymap.set("n", "<leader>sr", ":%s///gc<Left><Left>", { desc = "Search and Replace (global)" })

-- map("n", "<leader>dd", function()
--   Snacks.bufdelete()
-- end, { desc = "Delete Buffer" })
--
