# Neovim Dotfiles

A minimal, modular Neovim configuration built with Lua, optimized for productivity and extensibility. This setup emphasizes performance, modern plugins, and a clean file structure for easy customization.

<img width="1920" height="1080" alt="screen_nvim" src="https://github.com/user-attachments/assets/fd240423-5f23-4517-9666-313567a42315" />


## Features

- **Lua-based**: Fully scripted in Lua for better performance and maintainability.
- **Plugin Management**: Uses [lazy.nvim](https://github.com/folke/lazy.nvim) for efficient plugin loading.
- **LSP Support**: Integrated Language Server Protocol for code intelligence (e.g., diagnostics, completion).
- **Syntax Highlighting**: Powered by Tree-sitter for accurate parsing.
- **Fuzzy Finding**: Telescope for fast file and text search.
- **File Explorer**: Nvim-tree for intuitive navigation.
- **Themes**: Customizable with support for popular themes like Gruvbox or Catppuccin along with my own flavor of themes fused with onedark.
- **Keybindings**: Intuitive mappings with `<Space>` as leader key.

#Themes

<table>
  <tr>
    <td><img width="480" height="270" alt="code_midday" src="https://github.com/user-attachments/assets/470f6f9d-ac4b-45c6-b40b-f6da4696c264" /></td>
    <td><img width="480" height="270" alt="codecool" src="https://github.com/user-attachments/assets/753ccb57-c959-44d7-8158-75435e3c24c7" /></td>
  </tr>
  <tr>
    <td><img width="480" height="270" alt="code_dim" src="https://github.com/user-attachments/assets/599bb25e-a80e-4fd3-9f74-5a30f53f5307" /></td>
    <td><img width="480" height="270" alt="code_duke" src="https://github.com/user-attachments/assets/d78b2818-9f51-4b50-a8fa-5b2478e9615e" /></td>
  </tr>
</table>

## Installation

1. **Prerequisites**:
   - Neovim 0.9+ (install via your package manager, e.g., `brew install neovim` on macOS).
   - Git for cloning.
   - Node.js and npm for some LSP servers (optional but recommended).

2. **Clone the Repository**:
   ```bash
   git clone https://github.com/p12dev/nvimConfig.git ~/.config/nvim
   ```

3. **Put the theme-config file in a seperate folder**
     - You can put the change_dark_attrib.lua file in a separate directory or in the same config folder.
  
4. **Ensure that the Onedark original config is setup like this for the extra themes**:
     - I've found some breaking changes after one dark is updated.
  
```lua
return {
	"olimorris/onedarkpro.nvim",
	priority = 1000, -- Ensure it loads first
	option = {
		cursorline = false,
		transparency = true,
	},
	config = function()
		local path = "/home/pt/.config/nvim/lua/plugins/ui/themes/"
		package.path = package.path .. ";" .. path .. "?.lua"
		local ui = require("plugins.ui.themes.default")
		require("onedarkpro").setup({
			colors = {
				onedark_vivid = ui["code_cool"],
				onelight = ui["code_dim"],
			},
			options = {
				transparency = false,
				cursorline = false,
			},
		})
		--
		vim.cmd("colorscheme onedark_vivid")
	end,
}
```
5. **Setting up toggle term**

    Toggle term has also received breaking changes and float term doesn't work as expected causing lags. So, I've found an unusual way of working with this.
    You can create a seperate file with the following code and set your keymap in the input.lua. This code snippet will open the term  in present working  		directory in floating direction.
```lua 
local cmd_toggle = "ToggleTerm"
local current_buffer = vim.fs.dirname(vim.api.nvim_buf_get_name(0))
print(current_buffer)
vim.api.nvim_cmd({ cmd = cmd_toggle, args = { "dir=" .. current_buffer, "size=" .. 2 } }, {})
```
