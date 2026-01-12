# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a personal Neovim configuration using lazy.nvim as the plugin manager. The entire configuration is managed through a single `init.lua` file located at the repository root.

## Architecture

### Single-File Configuration
All configuration lives in `init.lua`:
- Vim options and settings (lines 1-31)
- Key mappings (lines 33-34)
- lazy.nvim bootstrap (lines 36-48)
- Plugin specifications with inline configuration (lines 50-114)

### Plugin Management
- Uses lazy.nvim for plugin management (bootstrapped automatically if not present)
- Plugins are defined inline within the `require("lazy").setup()` call
- Each plugin is configured as a table with dependencies, keymaps, and config options
- Plugin versions are locked in `lazy-lock.json`

### Current Plugin Stack
- **neo-tree.nvim**: File explorer (toggle with `<leader>e`)
- **telescope.nvim**: Fuzzy finder for files, grep, buffers, help tags
- **lualine.nvim**: Status line
- **conform.nvim**: Auto-formatter (configured for Lua with stylua)
- **toggleterm.nvim**: Terminal toggling (toggle with `<C-/>`)
- **lazygit.nvim**: Git UI integration (requires lazygit to be installed)

## Development Commands

### Neovim Operations
```bash
# Open Neovim
nvim

# Open Neovim with init.lua
nvim init.lua

# Check Neovim health
nvim +checkhealth
```

### Plugin Management (inside Neovim)
```vim
:Lazy                " Open lazy.nvim UI
:Lazy sync           " Install/update plugins based on init.lua
:Lazy clean          " Remove unused plugins
:Lazy restore        " Restore plugins to lazy-lock.json versions
```

### Formatting
The configuration uses conform.nvim with stylua for Lua formatting:
- Format-on-save is enabled (timeout: 500ms)
- Requires stylua to be installed: `pacman -S stylua` or equivalent

Manual formatting from command line:
```bash
stylua init.lua
```

### External Dependencies
- **stylua**: Required for Lua formatting (`pacman -S stylua`)
- **lazygit**: Required for git UI integration (`pacman -S lazygit`)

## Key Bindings

### Leader Key
- Leader: `<Space>`

### Built-in Mappings
- `<Esc>`: Clear search highlights

### Plugin Mappings
- `<leader>e`: Toggle Neo-tree file explorer
- `<leader>ff`: Telescope find files
- `<leader>fg`: Telescope live grep
- `<leader>fb`: Telescope buffers
- `<leader>fh`: Telescope help tags
- `<leader>gg`: Open LazyGit
- `<C-/>`: Toggle terminal (both normal and terminal mode)

## Configuration Philosophy

### Adding New Plugins
When adding plugins to this configuration:
1. Add the plugin spec to the `require("lazy").setup()` table in init.lua
2. Include keybindings in the `keys` table when possible (lazy-loads on key press)
3. Use the `config` function for setup requiring `require().setup()` calls
4. Use `opts` table for simple configurations that can be passed directly to setup()

### Editing Approach
- This is a minimalist configuration - avoid adding complexity
- Keep all configuration in init.lua unless the file grows too large
- Prefer lazy-loading via `keys`, `cmd`, or `ft` specifications
- Format-on-save is enabled, so conform.nvim will auto-format on write

## File Structure
```
.
├── init.lua           # Main configuration file
├── lazy-lock.json     # Plugin version lock file (managed by lazy.nvim)
├── README.md          # Personal readme
└── .git/              # Git repository
```
