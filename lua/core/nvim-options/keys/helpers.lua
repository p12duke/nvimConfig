local M = {}
local completions_list = {
	"command",
	"dir_in_path",

}

M.sum = function(a, b)
	return a + b
end
-- floats command mode input using vim.ui input)()
M.cd_diag = function()
	vim.ui.input({ prompt = "Command mode", completion = completions_list[1] }, function(inp)
		vim.cmd(inp)
	end)
	-- code
end
-- allows to move to specified line numbers
M.run_c = function()
	vim.ui.input({ prompt = "Enter Args:" }, function(i)
		if i then
			-- local buf_dir = vim.fs.dirname(vim.api.nvim_buf_get_name(0))
			-- local buf_name = vim.api.nvim_buf_get_name(0)
			local main = "bin"
			local sources = "%" -- regex for including the current_file or manually implement sources
			-- local args = i
			local flags = "-Wall -g"
			-- local prg = string.format("!gcc %s -o %s", flags, main)
			-- local app = string.format(" !./%s \t\n", main)
			vim.api.nvim_cmd({ cmd = "!", args = { "gcc", flags, sources, "-o" .. "" .. main } }, {})
			vim.api.nvim_cmd({ cmd = "!", args = { "./bin", ";" } }, {})
		end
	end)
end
M.mv = function()
	vim.ui.input({ prompt = "Move to line: " }, function(i)
		vim.cmd(i)
	end)
end

return M
