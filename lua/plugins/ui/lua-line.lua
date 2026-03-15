return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	--config
	--#region
	config = function()
		-- Bubbles config for lualine
		-- Author: lokesh-krishna
		-- MIT license, see LICENSE for more details.

		-- stylua: ignore
		local colors = {
			blue   = '#182131',
			cyan   = '#79dac8',
			black  = '#003e4d',
			white  = '#616182',
			red    = '#ff5189',
			violet = '#202939',
			grey   = '#183131',
		}

		local bubbles_theme = {
			normal = {
				a = { fg = colors.black, bg = colors.violet },
				b = { fg = colors.white, bg = colors.grey },
				c = { fg = colors.white, bg = colors.blue },
			},

			insert = { a = { fg = colors.black, bg = colors.blue } },
			visual = { a = { fg = colors.black, bg = colors.cyan } },
			replace = { a = { fg = colors.black, bg = colors.red } },

			inactive = {
				a = { fg = colors.white, bg = colors.black },
				b = { fg = colors.white, bg = colors.black },
				c = { fg = colors.white },
			},
		}

		require("lualine").setup({
			options = {
				theme = bubbles_theme,
				component_separators = "",
				padding = {
					right = 3,
				},
				section_separators = { left = "", right = "̍" },
			},
			sections = {
				lualine_x = { "branch" },
				lualine_z = { "filetype" },
				lualine_a = {},
				lualine_b = {},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = { "" },
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			tabline = {},
			extensions = {},
		})
	end,
}
