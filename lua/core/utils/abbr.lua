vim.api.nvim_create_user_command("CS", function()
	local M = {}
	local N = { "pythonic", "camelCaseStyle" }
	local hl_capture_at_pos = vim.treesitter.get_captures_at_cursor(0)
	-- for key, value in pairs(hl_capture_at_pos) do
	-- 	print(key .. "" .. value)
	-- end
	local code_style = vim.api.nvim_create_augroup("code_style", { clear = true })
	-- local tobeReplaced = "/-"
	local shouldbeReplacedBy = "/_"
	local pat_snake_case =
	'\\(\\"[^" ]*\\|\\(-\\{2}\\)\\)\\@<!\\-'                     -- match excludes the pattern in string and replace all the occurence of -
	local flag = "/e"
	local max = 8

	local function test_hl_contains()
		if vim.tbl_contains(hl_capture_at_pos, "variable") then
			while max > 0 do
				vim.cmd("%s/" .. pat_snake_case .. shouldbeReplacedBy .. flag)
				print("match found a variable")
				max = max - 1
			end
		else
			print("error")
		end
		if vim.tbl_contains(hl_capture_at_pos, "string") then
			print("Unmatched")
		end
	end
	vim.api.nvim_create_autocmd({ "InsertLeave", "InsertEnter", "BufWritePre" }, {
		pattern = { "*.py", "*.c" },
		group = code_style,
		callback = test_hl_contains,
		once = true,
	})
end, { desc = "Change codingstyle" })
