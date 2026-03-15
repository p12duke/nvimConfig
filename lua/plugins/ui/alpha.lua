return {
	"goolord/alpha-nvim",
	dependencies = {
		"echasnovski/mini.icons",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		local ascii_art = {

			[[                        ]],
			[[                             ]],
			[[                                ]],
			[[                         ]],
			[[                      ]],
		}

		-- Set header
		dashboard.section.header.val = ascii_art

		-- Define the highlight groups with desired colors
		-- Set buttons
		dashboard.section.buttons.val = {
			dashboard.button("o", "  Open recent files", ":Telescope oldfiles<CR>"),
			dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("s", "  Settings", ":e /home/pt/.config/nvim/lua/modules.lua<CR>"),
			dashboard.button("q", "  Quit", ":qa<CR>"),
			dashboard.button(
				"t",
				"  theme",
				":luafile /home/pt/.config/nvim/lua/plugins/ui/themes/change_onedark_attrib.lua<CR>"
			),
		}

		-- Set footer
		dashboard.section.footer.val = "Have a great coding session!"

		-- Final setup
		alpha.setup(dashboard.opts)
	end,
}
