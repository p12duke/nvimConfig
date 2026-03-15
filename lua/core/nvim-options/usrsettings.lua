print("Settings applied..")
-- Set foldtext as a Lua function
-- function customText(bufnr)
-- 	bufnr = vim.api.nvim_get_current_buf()
-- 	local tex = "Folded"
-- 	-- local get_line=vim.fn.getline(v:foldstart)
-- 	return "hello" .. bufnr .. "]" .. tex
-- end

-- vim.cmd.foldtext = "custmText()"
--colorschemes
-- vim.cmd("highlight Folded  guifg=#35aa7d guibg=#20272d")

-- vim.cmd("highlight FloatBorder guibg=NONE") -- if you don't want weird border background colors around the popup.
-- Options
local options = {
	syntax = "on",
	number = true,
	relativenumber = false,
	clipboard = "unnamedplus",
	mouse = "a",
	smartindent = false,
	swapfile = false,
	shiftwidth = 4,
	tabstop = 2,
	backup = false,
	cursorline = true,
	sidescroll = 8,
	scrolloff = 8,
	fillchars = { fold = ">" },
	foldmethod = "expr",
	foldexpr = "nvim_treesitter#foldexpr()",
	hlsearch = false,
	cmdheight=1,
}
--getting the key-value pairs
for k, v in pairs(options) do
	vim.opt[k] = v
end
