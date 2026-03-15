local theme = {

	["code_cool"] = {
		-- bg = "#182131",
		-- fg = "#626364",  --foreground
		bg = "#182131",
		fg = "#929292",
		purple = "#17584c", --headers and identifiers as well as returns
		green = "#2d852d", --string and numbers
		blue = "#105a9f", --Function names and the defs
		red = "#8a7769", --keywords and identifiers
		yellow = "#982eb9", --Brackets
		orange = "#645d2b", --Value
		gray = "#2c5f9b", --Opts
		cyan = "#7c535b", --SpecialKey
	},
	["code_midday"] = {

		--bg = "#23414a", --original bg
		--bg = "#1c353e", --testing bg
		bg = "#002B36",
		fg = "#978A8B", --foregroundset_hlgroup in neovim
		purple = "#4c87A0", --headers and identifiers as well as returns
		green = "#4ea64e", --string and numbers
		blue = "#3882c7", --Function names and the defs
		red = "#7d7d7d", --keywords and identifiers
		yellow = "#7a7f52", --Brackets (Brackets will apply to programming language like lua but for other langs use [@lsp.brackets])
		orange = "#7d7644", --Value
		gray = "#000000", --Opts
		cyan = "#37af89", --SpecialKey
	},
		["code_dim"] = {

			bg = "#0b1623", --background (og)
			-- bg = "#908567", --background (og)
			-- bg = "#454545",
			-- bg = "#5f5f79",
			fg = "#242424", --foreground
			purple = "#493f58", --headers and identifiers as well as returns
			green = "#00443b", --string and numbers
			blue = "#01476c", --Function names and the defs
			--red = "#864a47", --keywords and identifiers
			red = "#763d3d", --keywords and identifiers
			yellow = "#004349", --Brackets
			orange = "#601b1c", --Value
			gray = "#375336", --Opts
			cyan = "#001e1e", --SpecialKey
		},
}
return theme
