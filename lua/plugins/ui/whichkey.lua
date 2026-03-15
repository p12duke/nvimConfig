--which key#==========================================
return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {

		-- your configuration comes here
		preset = "classic",
		triggers = {
			{ "<leader>", mode = { "n", "v" } },
			{ "g",        mode = { "n", "v" } },
			{ "z",        mode = { "n", "v" } },
			{ "b",        mode = { "n" } },
			{ "w",        mode = { "n" } },
			{ "o",        mode = { "n" } },
		},
	}, -- or leave it empty to use the default settings
	-- refer to the configuration section below
}

--comments #=============================================

-- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
