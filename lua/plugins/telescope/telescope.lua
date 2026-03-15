return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	-- or                              , branch = '0.1.x',
	dependencies = { "nvim-lua/plenary.nvim" },

	--Main:setting()
	config = function()
		local builtin = require("telescope.builtin")
		local wk = require("which-key")
		local opts = { noremap = true, silent = true }
		-- vim.keymap.set('n', 'ff', builtin.find_files, {})
		-- vim.keymap.set('n', 'fg', builtin.live_grep, {})
		-- vim.keymap.set('n', 'fb', builtin.buffers, {})
		-- vim.keymap.set('n', 'fh', builtin.help_tags, {})
		vim.keymap.set("n", "oo", builtin.oldfiles, {})
		vim.keymap.set("n", "cc", builtin.colorscheme, {})
		-- vim.keymap.set('n', 'fz', builtin.current_buffer_fuzzy_find, {})
		-- vim.keymap.set('n', 'fv', builtin.vim_options, {})
		--

		wk.register({
			o = {
				o = { "<cmd>Telescope oldfiles <CR>", " :Find File" },
				h = { "<cmd>Telescope help_tags<CR>", " :Find Help" },
				-- t = { "<cmd>Telescope colorscheme<CR>", " :colorscheme" },
				g = { "<cmd>Telescope live_grep<CR>", " :Live Grep" },
				bf = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", " :Find_in_Buffer" },
				v = { "<cmd>Telescope vim_options<CR>", " :VIM_OPTIONS" },
				b = { "<cmd>Telescope buffers<CR>", "࿊ :Buffers" },
				m = { "<cmd>Telescope man_pages<CR>", "📃:Man_pages" },
				x = { "<cmd>Telescope builtin<CR>", "📃:All tool at one place" },
			},
		}, opts)

		--layout 
		local no_preview = function()
			return require("telescope.themes").get_dropdown({
				borderchars = {
					{ "─", "│", "─", "│", "┌", "┐", "┘", "└" },
					prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
					results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
					preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
				},
				width = 0.8,
				previewer = false,
				prompt_title = false,
			})
		end
	end,
}
