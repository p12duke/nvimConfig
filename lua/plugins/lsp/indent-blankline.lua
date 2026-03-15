return {
	'lukas-reineke/indent-blankline.nvim',
	main = 'ibl',
	event = 'UIEnter',
	enabled = true,
	opts = {
		exclude = {
			-- stylua: ignore
			filetypes = {
				'dbout', 'neo-tree-popup', 'log', 'gitcommit',
				'txt', 'help', 'NvimTree', 'git', 'flutterToolsOutline',
				'undotree', 'markdown', 'norg', 'org', 'orgagenda',
			},
		},
		indent = {
			char = '║', -- ▏┆ ┊ 
			tab_char = '║',
		},
		scope = {
			char = '⫼',
		},
	},
	config = function(_, opts)
		require('ibl').setup(opts)
		local highlight = {
			"RainbowRed",
			"RainbowYellow",
			"RainbowBlue",
			"RainbowOrange",
			"RainbowGreen",
			"RainbowViolet",
			"RainbowCyan",
		}
		local hooks = require "ibl.hooks"
		-- create the highlight groups in the highlight setup hook, so they are reset
		-- every time the colorscheme changes
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#006c75" })
			vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#946f2a" })
			vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#0d5b9b" })
			vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#a06935" })
			vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#618c42" })
			vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#73258a" })
			vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#12727e" })
		end)

		vim.g.rainbow_delimiters = { highlight = highlight }
		require("ibl").setup { scope = { highlight = highlight } }

		hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
	end,
}
