--Abbreviate easily
local M = {}

M.abbr = function()
	vim.ui.input({ prompt = 'select your word' }, function(input_1)
		vim.ui.input({ prompt = 'select abbrev.' }, function(input_2)
			vim.cmd.abbreviate(input_1, input_2)
		end)
	end)
end

return M
