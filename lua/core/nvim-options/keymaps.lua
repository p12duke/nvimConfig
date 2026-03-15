print("maps: ready  ")
-- {Nvim-Keymaps}----------------
local opts = { noremap = true, silent = true }
local map = vim.keymap.set
local wk = require("which-key")
-- package.path must be included
-- loads a set of custom user-defined  functions
local tx = require("core.nvim-options.keys.helpers")
local nv = require("core.nvim-options.keys.nvimtree_tbl")
--Returns a ThemePalette Table
-- loads a set of user-defined neovim tree functions
--loads a custom set of theme made from onedarkpro

-- vim.g.mapleader = " "
-- {Basic Mappings}---------------

map("n", "W", ":w%<CR>", opts)
map("n", "<C-s>", ":so%<CR>", opts)
map("i", "fj", "<ESC>", opts)
map("i", "<C-p>", "<ESC><ESC>", opts)
-- This keymap will allow to move the line nu within visible area. 
map("n", "m", tx.mv, opts)
-- This keymap will allow to take prompt for CMD_MODE. 
map("n", "cd", tx.cd_diag, opts)
--custom lazy and fold functions
map("n", "zm", ":mkview<CR>", opts)
map("n", "zl", ":loadview<CR>", opts)
map("n", "zf", ":luafile ~/mycodespace/Vim_script/testLua/lua/int_g_test.lua<CR>", opts)
-- map("n", "so", ":Lazy reload onedarkpro.nvim<CR>", opts)
map("n", "th", ":luafile ~/mycodespace/Vim_script/testLua/lua/change_onedark_attrib.lua<CR>", opts)
map("n", "va", ":CS<CR>", opts)
-- {NvimTree keymaps }---------------
-- methods:
-- can access a dir from the fav_folder listed in another table
-- we can also register another dirs easily just like bookmarks and move to the dir or just remove it if not required
-- load in isolated buffer or current buffer when working on project

wk.register({
	["<leader>"] = {
		n = { "<cmd>NvimTreeToggle<CR>", "  Nvim-tree toggle" },
		x = {
			name = "NvimTree open",
			d = {
				function()
					nv.load_dir("dev")
				end,
				" Dev",
			},
			s = {
				function()
					nv.load_dir("config")
				end,
				" settings",
			},
			n = {
				function()
					nv.load_dir("neovim_config")
				end,
				" Nvim-Settings",
			},
			c = {
				function()
					nv.load_dir("c")
				end,
				" C/C++",
			},
			b = {
				function()
					nv.load_curr_buffer()
				end,
				"﬘ Buffer",
			},
		},
	},
}, opts)

-- {Formatting}-----------------------
map("n", "<leader>fo", ":lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })
-- {Buffer:Settings}-------------------
map("n", "zq", ":q!<CR>", opts)

-- {Insert Mode custom mappings}--------------------------------------------------------------------------
map({ "n", "v" }, "ge", "$", opts)
map({ "n", "v" }, "gs", "0", opts)
--copy function
map({ "i" }, "<M-p>", "<c-r>+", opts)

-- {ToggleTerm Mappings}----------------------------------------------------------------------------------
map("n", "<M-m>", function()
	local current_buffer = vim.fs.dirname(vim.api.nvim_buf_get_name(0))
	print(current_buffer)
	vim.api.nvim_cmd({ cmd = "ToggleTerm", args = { "dir=" .. current_buffer } }, {})
end, opts)

-- {Split windows manage}---------------------------------------------------------------------------------

map("n", ";", "<C-w><C-w>", opts)
map("n", "<C-L>", "<C-w>+", opts)
-- map('n', 'sv', ':vsplit<CR>', opts)
wk.register({
	w = {
		name = "split_manage",
		v = { "<cmd>vsplit<CR>", "⇪ vertically split" },
		h = { "<cmd>split<CR>", " ⇒ horizontally split" },
		l = { "<C-W>+", "increase height" },
		w = { "<C-W>>", "increase width" },
		m = { "<C-^>", "switch buffer in current window" },
	},
}, opts)
-- {Color Picker}---------------------------------------------------------------------------------
wk.register({
	["<leader>"] = {
		name = "Pick a color",
		c = { "<cmd>PickColor<CR>", "Pick a color" },
		-- b = { "<cmd>PickColorInsert<CR>", "Insert a color" }
	},
}, opts)
-- {Copy_Move}---------------------------------------------------------------------------------
-- {
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
-- }
--
-- {Build: Compile}----------------------------------------------------------------------------------
wk.register({
	b = {
		name = "Build and Compile",
		b = { "<cmd>!node %<CR>", "Run: :node/js" },
		l = { "<cmd>!lua %<CR>", "Run: :Lua" },
		p = { "<cmd>!python3 %<CR>", "Run: :Python " },
		g = { "<cmd>!go run %<CR>", "Run  :Go " },
		cp = { "<cmd>!g++ %  && echo 'Compilation successful' ;./a.out <CR>", "Run:  :C/C++  " },
		cc = { "<cmd>!g++ %  && echo 'Compilation successful' ;./a.out <CR>", "Run:  :C/C++  " },
		ct = { tx.run_c, "Run: c/C++" },
		ba = { "<cmd>!bash %<CR>", "Run: Bash" }, --function(), 'Run: /Bash' },
	},
}, opts)
-- wk.add({
-- 	{ "<leader>b",   desc = "Builds" },
-- 	{ "<leader>ba",  "<cmd>!lua %<CR>",                                             desc = "Build lua  " },
-- 	{ "<leader>bcc",  "<cmd>!gcc %  && echo 'Compilation successful' ;./a.out <CR>", desc = "Builds c  " },
-- 	{ "<leader>bb",  "<cmd>!bash %<CR>",                                            desc = "Builds bash  " },
-- 	{ "<leader>bp",  "<cmd>!python3 %<C<cmd>!python3 %<CR>R>",                      desc = "Builds python  " },
-- 	{ "<leader>bo",  "<cmd>!node %<CR>",                                            desc = "Builds other  " },
-- 	{ "<leader>bcp", "<cmd>!gcc %  && echo 'Compilation successful' ;./a.out <CR>", desc = "Builds c++  " },
-- })
-- Lsp: Language server keymaps
wk.register({
	["<leader>"] = {
		l = {
			name = "[LSP actions  ]",
			r = { "<cmd>Telescope lsp_references<CR>", " :[get docx]" },
			a = {
				function()
					vim.lsp.buf.code_action()
				end,
				" :[code actions]",
			},
			x = {
				function()
					vim.cmd("LspRestart")
					print("Restarting server...")
				end,
				" [Restart LSP]",
			},
			c = {
				function()
					vim.lsp.buf.rename()
				end,
				"LSP: Rename",
			},
			f = {
				function()
					vim.lsp.buf.format({
						async = true,
						filter = function(client)
							return client.name ~= "prettier"
						end,
					})
				end,
				"Formatting ..",
			},
			d = {
				b = { "<cmd>Telescope diagnostics bufnr=0<CR>", " diag for current Buffer" },
				l = {
					function()
						vim.diagnostic.open_float()
					end,
					"diag in current buf as line",
				},
				p = {
					function()
						vim.diagnostic.goto_prev()
					end,
					"diag in prev buf as line",
				},
				n = {
					function()
						---@diagnostic disable-next-line: deprecated
						vim.diagnostic.goto_next()
					end,
					"diag in next buf as line",
				},
			},
		},
	},
}, opts)
local molten_mappings = {
	m = {
		name = "Molten",                                                -- Name for the group
		s = { "<cmd>MoltenInit<CR>", "Start Molten" },                  -- Start molten
		p = { "<cmd>MoltenShowOutput<CR>", "Print Molten" },            -- Pause molten
		r = { "<cmd>MoltenReevaluateAll<CR>", "Evaluate all" },         -- Resume molten
		e = { "<cmd>MoltenEvaluateLine<CR>", "Show Molten Output or Image" }, -- End molten
		t = {
			function()
				vim.ui.input({
					prompt = "Enter your line range",
				}, function(input)
					local start_line = 1
					vim.fn.MoltenEvaluateRange(start_line, input)
				end)
			end,
			"Evaluate Range of VisualMode  Molten",
		},                                                 -- Toggle molten
		o = { "<cmd>MoltenEnterOutput<CR>", "Enter output" }, -- List sessions
		q = { "<cmd>MoltenDeinit<CR>", "MoltenDeinit or quit" }, -- List sessions
	},
}
wk.register(molten_mappings, { prefix = "<leader>" })

