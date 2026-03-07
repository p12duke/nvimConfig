-- Main Settings and Imports vim.g.mapleader = " "



--custom keymaps
-- vim.keymap.set("n", ";", ":", { silent = true, noremap = true })
vim.g.maplocalleader = ";"
vim.g.mapleader = " "
vim.keymap.set("i", "fj", "<ESC><CR>", { silent = true, noremap = true })
vim.keymap.set("n", "W", ":w %<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<C-s>", ":so %<CR>", { silent = true, noremap = true })
-- Custom Table
--
-- One dark
require("lazy_build")
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

-- Setup lazy.nvim
require("lazy").setup({
	-- Configure any other settings here. See the documentation for more details.
	{ import = "plugins.lsp" },
	{ import = "plugins.ui" },
	{ import = "plugins.others" },
	{ import = "plugins.telescope" },
	-- automatically check for plugin updates
})
-- call all the files from modules
require("modules")
