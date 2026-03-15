local M = {}
local open = vim.cmd.NvimTreeOpen
-- Favourite Dir or Dir which are used recurrently
M.loaded_dir = {
	dev = "/home/pt/mycodespace/",
	config = "/home/pt/.config/",
	neovim_config = "/home/pt/.config/nvim/lua/",
	c = "/home/pt/mycodespace/c",
}

--Loads from the Neovim Tree Table
M.load_dir = function(index)
	open(M.loaded_dir[index])
end
-- Load current_buffer directory
M.load_curr_buffer = function()
	local current_buffer = vim.fs.dirname(vim.api.nvim_buf_get_name(0))
	-- print(current_buffer)
	vim.cmd.NvimTreeFindFileToggle(current_buffer)
end


return M
