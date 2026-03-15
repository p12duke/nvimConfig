local test_grp = vim.api.nvim_create_augroup("test_grp", { clear = true })

local abbrev_autocmd = vim.api.nvim_create_autocmd({ "BufEnter", "BufReadPost", "BufWritePost" }, {
	pattern = { "*.c,*.h" },
	group = test_grp,
	command = "abbreviate nx \\n ",
})
