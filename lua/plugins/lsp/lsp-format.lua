---@diagnostic disable: unused-local
local M = {
	"nvimtools/none-ls.nvim",
}

function M.config()
	local null_ls = require("null-ls")

	-- code action sources
	local code_actions = null_ls.builtins.code_actions

	-- diagnostic sources
	local diagnostics = null_ls.builtins.diagnostics

	-- formatting sources
	local formatting = null_ls.builtins.formatting

	-- hover sources
	local hover = null_ls.builtins.hover

	-- completion sources
	local completion = null_ls.builtins.completion

	null_ls.setup({
		sources = {
			formatting.stylua,
			formatting.prettier,
			completion.spell,
			formatting.black, -- python formatter
			formatting.clang_format, --c format
			formatting.cmake_format,
			formatting.mdformat,
			formatting.prettierd,
			formatting.djlint,
			formatting.asmfmt,
			formatting.mbake,
			formatting.beautysh,
			--@ diag
			-- diagnostics.pylint, -- python diag
			--@ code-completions
			code_actions.refactoring,
		},
	})
end

return M
