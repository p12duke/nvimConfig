vim.cmd(" IBLDisable")
local path = "/home/pt/mycodespace/Vim_script/testLua/lua/"
package.path = package.path .. ";" .. path .. "?.lua"
local random_color = require("themes.random_color")

ThemePalete = {

	theme_flavor = {
		["code_midday"] = {

			--bg = "#23414a", --original bg
			--bg = "#1c353e", --testing bg
			bg = "#002530",
			fg = "#877a7b", --foregroundset_hlgroup in neovim
			purple = "#4c87A0", --headers and identifiers as well as returns
			green = "#4ea64e", --string and numbers
			blue = "#3882c7", --Function names and the defs
			red = "#7d7d7d", --keywords and identifiers
			yellow = "#7a7f52", --Brackets (Brackets will apply to programming language like lua but for other langs use [@lsp.brackets])
			orange = "#7d7644", --Value
			gray = "#000000", --Opts
			cyan = "#37af89", --SpecialKey
		},
		["code_cool"] = {
			-- bg = "#182131",
			-- fg = "#626364",  --foreground
			bg = "#182131",
			fg = "#5b5b5b",
			purple = "#17584c", --headers and identifiers as well as returns
			green = "#2d852d", --string and numbers
			blue = "#105a9f", --Function names and the defs
			red = "#8a7769", --keywords and identifiers
			yellow = "#982eb9", --Brackets
			orange = "#645d2b", --Value
			gray = "#002561", --Opts
			cyan = "#7c535b", --SpecialKey
		},
		["code_light"] = {

			bg = "#8b8e8f", --background original
			-- bg = "#959396", --background testing
			fg = "#333333", --foreground
			--purple = "#1a5339", --headers and identifiers as well as returns | classs keyword
			purple = "#4a3813", --headers and identifiers as well as returns | classs keyword
			green = "#3d3842", --string and numbers
			blue = "#0d4559", --Function names and the defs
			--red = "#763a37", --keywords and identifiers
			red = "#2a4745", --keywords and identifiers
			yellow = "#3b4434", --Brackets
			orange = "#3f3f3f", --Value
			gray = "#6a514f", --Opts |values
			cyan = "#3a3a3a", --SpecialKey|imports
		},
		["code_dim"] = {

			bg = "#0b1623", --background (og)
			-- bg = "#908567", --background (og)
			-- bg = "#454545",
			-- bg = "#acacc6",
			fg = "#565656", --foreground
			purple = "#564c65", --headers and identifiers as well as returns
			green = "#0b5b4c", --string and numbers
			blue = "#01476c", --Function names and the defs
			--red = "#864a47", --keywords and identifiers
			red = "#52422c", --keywords and identifiers
			yellow = "#004349", --Brackets
			orange = "#6e292a", --Value
			gray = "#375336", --Opts
			cyan = "#3a4040", --SpecialKey
		},
		["code_duke"] = {

			bg = "#161417", --background testing
			fg = "#144848", --foreground
			--purple = "#377056", --headers and identifiers as well as returns | classs keyword
			purple = "#4c3861", --headers and identifiers as well as returns | classs keyword
			green = "#434938", --string and numbers
			blue = "#ad1c5b", --Function names and the defs
			--red = "#814542", --keywords and identifiers
			red = "#13425c", --keywords and identifiers
			yellow = "#263e44", --Brackets
			orange = "#8a3d00", --Value
			gray = "#71693f", --Opts |values
			cyan = "#003d7b",
		},
	},
	theme_elms = {
		bracket = {
			["code_cool"] = "#324486",
			["code_midday"] = "#42728f",
			["code_light"] = "#ac1c15",
			["code_dim"] = "#0f2163",
		},
		numbers = {
			["code_cool"] = "#6e457a",
			["code_midday"] = "#676767",
			["code_light"] = "#32454a",
			["code_dim"] = "#433029",
		},
		Comment = {
			["code_cool"] = "#333f61",
			["code_midday"] = "#8c4365",
			["code_light"] = "#4f4b4b",
			["code_duke"] = "#695c5c",
			["code_dim"] = "#304959",
		},
		TelescopeFg = {
			["code_cool"] = "#5c688a",
			["code_midday"] = "#7e9099",
			["code_light"] = "#483b3b",
			["code_dim"] = "#464f56",
		},
		TelescopeBg = {
			["code_cool"] = "#0f0022",
			["code_midday"] = "#3c3c3c",
			["code_light"] = "#897c7c",
			["code_dim"] = "#675890",
		},
		TelescopeMultiSelection = {
			["code_cool"] = "#475375",
			["code_midday"] = "#64767f",
			["code_light"] = "#463939",
			["code_dim"] = "#403169",
		},
		WhichkeyNormal = {
			["code_cool"] = "#14243a",
			["code_midday"] = "#0e313c",
			["code_light"] = "#756e7f",
			["code_dim"] = "#0b192b",
		},
		Folded = {
			["code_midday"] = "#27454e",
			["code_cool"] = "#161f2f",
			["code_light"] = "#342727",
			["code_dim"] = "#838399",
		},
		DiagnosticVirtualTextWarn = {
			["code_midday"] = "#701a4e",
			["code_cool"] = "#161f2f",
			["code_light"] = "#4a7979",
			["code_dim"] = "#4f3b39",
		},
		DiagnosticVirtualTextWarnText = {
			["code_midday"] = "#797979",
			["code_cool"] = "#dc7c8c",
			["code_light"] = "#1f4e4e",
			["code_dim"] = "#484848",
		},
		ErrorMsg = {
			["code_midday"] = "#797979",
			["code_cool"] = "#dc7c8c",
			["code_light"] = "#1f4e4e",
			["code_dim"] = "#303030",
		},

		DiagnosticUnderlineError = {
			["code_midday"] = "#797979",
			["code_cool"] = "#dc7c8c",
			["code_light"] = "#1f4e4e",
			["code_dim"] = "#303030",
		},
		-- Walls = {
		-- 	["code_midday"] = "great_power.jpg",
		-- 	["code_cool"] = "car_race.jpg",
		-- 	["code_light"] = "Warrior_Stranding_hd.jpg",
		-- 	["code_dim"] = "Warrior_Stranding_hd.jpg",
		-- },
	},
}

local function color_changer()
	--Wallpaper path
	local wall_path = "$HOME/walls/"

	---Lots of themes and colors 😻
	ThemePalete.theme_flavor.select_fn = vim.ui.select(
		{ "code_midday", "code_cool", "code_light", "code_dim", "code_duke" },
		{ prompt = "Enter your theme" },
		function(theme)
			require("onedarkpro").setup({
				colors = {
					onedark_vivid = ThemePalete.theme_flavor[theme],
				},
				options = {
					transparency = false,
				},
			})
			-- set custom highlights manually. onedarkpro highlights group won't apply. But, make sure to set NIL or {} in original settings
			--vim.cmd("!feh --bg-fill " .. wall_path .. ThemePalete.theme_elms.Walls[theme])

			local fg_text = tostring(random_color.rand_color())
			local bg_border = tostring(random_color.rand_color())
			local adjust_color = function(color, value, props)
				if props == "darken" then
					value = require("onedarkpro.helpers").darken(color, value)
					return value
				else
					if props == "brighten" then
						value = require("onedarkpro.helpers").brighten(color, value)
						return value
					end
				end
			end
			require("onedarkpro.config").set_theme("onedark_vivid")

			require("onedarkpro").load()
			vim.api.nvim_set_hl(0, "Comment", { fg = ThemePalete.theme_elms.Comment[theme] })
			vim.api.nvim_set_hl(0, "Punctuation", { fg = ThemePalete.theme_elms.bracket[theme] })
			vim.api.nvim_set_hl(0, "FoldColumn", { fg = ThemePalete.theme_elms.numbers[theme] })
			vim.api.nvim_set_hl(0, "MatchParen", { fg = "#cd3a5b" })
			vim.api.nvim_set_hl(0, "Folded", {
				fg = ThemePalete.theme_elms.bracket[theme],
				bg = adjust_color(ThemePalete.theme_flavor[theme].bg, 1, "darken"),
			})
			vim.api.nvim_set_hl(0, "LineNr", { fg = ThemePalete.theme_elms.numbers[theme] })
			vim.api.nvim_set_hl(0, "Pmenu", { fg = ThemePalete.theme_elms.numbers[theme] })
			vim.api.nvim_set_hl(0, "Float", { fg = ThemePalete.theme_elms.numbers[theme] })
			vim.api.nvim_set_hl(
				0,
				"TelescopeNormal",
				{ fg = ThemePalete.theme_elms.TelescopeFg[theme], bg = ThemePalete.theme_flavor[theme].bg }
			) --list of the text in Telescope Buffer
			vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = ThemePalete.theme_elms.TelescopeFg[theme] })
			vim.api.nvim_set_hl(0, "TelescopePrompt", { fg = ThemePalete.theme_elms.TelescopeFg[theme] })
			vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = ThemePalete.theme_elms.TelescopeBg[theme] })
			vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = ThemePalete.theme_elms.TelescopeFg[theme] })
			vim.api.nvim_set_hl(0, "TelescopeSelection", {
				fg = ThemePalete.theme_flavor[theme].fg,
				bg = adjust_color(ThemePalete.theme_flavor[theme].bg, 5, "darken"),
			})
			vim.api.nvim_set_hl(0, "WhichkeyNormal", { bg = ThemePalete.theme_elms.WhichkeyNormal[theme] })
			vim.api.nvim_set_hl(0, "NormalFloat", { fg = ThemePalete.theme_flavor[theme].fg }) --text for the floating menu default
			-- vim.api.nvim_set_hl(0, "NormalFloatBorder", {})
			vim.api.nvim_set_hl(0, "FloatBorder", { bg = ThemePalete.theme_flavor[theme].bg }) --border for the normal window
			vim.api.nvim_set_hl(0, "Pmenu", { bg = ThemePalete.theme_flavor[theme].bg })
			vim.api.nvim_set_hl(0, "CurSearch", { bg = ThemePalete.theme_flavor[theme].bg })
			vim.api.nvim_set_hl(0, "Visual", { bg = adjust_color(ThemePalete.theme_flavor[theme].bg, 4, "darken") })

			vim.api.nvim_set_hl(0, "IncSearch", { bg = ThemePalete.theme_elms.TelescopeBg[theme] })
			-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = ThemePalete.theme_flavor[theme].fg, fg = ThemePalete.theme_flavor[theme].bg })
			vim.api.nvim_set_hl(
				0,
				"TelescopeMultiSelection",
				{ fg = ThemePalete.theme_elms.TelescopeMultiSelection[theme], bg = ThemePalete.theme_flavor[theme].bg }
			)
			vim.api.nvim_set_hl(
				0,
				"DiagnosticVirtualTextWarn",
				{ fg = ThemePalete.theme_elms.DiagnosticVirtualTextWarnText[theme], bg = "#00000b" }
			)
			vim.api.nvim_set_hl(
				0,
				"DiagnosticUnderlineError",
				{ fg = ThemePalete.theme_elms.DiagnosticVirtualTextWarnText[theme] }
			)
			vim.api.nvim_set_hl(0, "ErrorMsg", { fg = ThemePalete.theme_elms.DiagnosticVirtualTextWarnText[theme] })
			vim.api.nvim_set_hl(0, "NonText", { fg = ThemePalete.theme_elms.DiagnosticVirtualTextWarnText[theme] })
		end
	)
end
color_changer()
