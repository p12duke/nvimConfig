return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local HEIGHT_RATIO = 0.8 -- You can change this
		local WIDTH_RATIO = 0.5 -- You can change this too

		require("nvim-tree").setup({
			--view config:
			view = {
				float = {
					enable = true,
					open_win_config = function()
						local screen_w = vim.opt.columns:get()
						local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
						local window_w = screen_w * WIDTH_RATIO
						local window_h = screen_h * HEIGHT_RATIO
						local window_w_int = math.floor(window_w)
						local window_h_int = math.floor(window_h)
						local center_x = (screen_w - window_w) / 2
						local center_y = ((vim.opt.lines:get() - window_h) / 2)
								- vim.opt.cmdheight:get()
						return {
							border = 'rounded',
							relative = 'editor',
							row = center_y,
							col = center_x,
							width = window_w_int,
							height = window_h_int,
						}
					end,
				},
				width = function()
					return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
				end,
			},
			--icons--settings
			renderer = {
				add_trailing = false,
				group_empty = false,
				full_name = false,
				root_folder_label = ":~:s?$?/..?",
				indent_width = 2,
				special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
				symlink_destination = true,
				highlight_git = false,
				highlight_diagnostics = false,
				highlight_opened_files = "none",
				highlight_modified = "none",
				highlight_bookmarks = "none",
				highlight_clipboard = "name",
				indent_markers = {
					enable = false,
					inline_arrows = true,
					icons = {
						corner = "└",
						edge = "│",
						item = "│",
						bottom = "─",
						none = " ",
					},
				},
				icons = {
					web_devicons = {
						file = {
							enable = true,
							color = true,
						},
						folder = {
							enable = false,
							color = true,
						},
					},
					git_placement = "before",
					modified_placement = "after",
					diagnostics_placement = "signcolumn",
					bookmarks_placement = "signcolumn",
					padding = " ",
					symlink_arrow = " ➛ ",
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
						modified = true,
						diagnostics = true,
						bookmarks = true,
					},
					glyphs = {
						default = "",
						symlink = "",
						bookmark = "󰆤",
						modified = "●",
						folder = {
							arrow_closed = "",
							arrow_open = "",
							default = "🗀 ",
							open = "",
							empty = " ",
							empty_open = " ",
							symlink = " ",
							symlink_open = " ",
						},
						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "★",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},
		})
	end,
}
