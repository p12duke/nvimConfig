return {
	"olimorris/onedarkpro.nvim",
	priority = 1000, -- Ensure it loads first
	option = {
		cursorline = false,
		transparency = true,
	},
	config = function()
		local path = "/home/pt/.config/nvim/lua/plugins/ui/themes/"
		package.path = package.path .. ";" .. path .. "?.lua"
		local ui = require("plugins.ui.themes.default")
		require("onedarkpro").setup({
			colors = {
				onedark_vivid = ui["code_cool"],
				onelight = ui["code_dim"],
			},
			options = {
				transparency = false,
				cursorline = false,
			},
		})
		--
		vim.cmd("colorscheme onedark_vivid")
	end,
}
