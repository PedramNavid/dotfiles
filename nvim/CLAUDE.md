# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a personal Neovim configuration using Lua and the Lazy.nvim plugin manager. The configuration is structured as a modular setup with organized plugin configurations and custom settings.

## Architecture

### Core Structure
- `init.lua` - Entry point that bootstraps Lazy.nvim and loads the main configuration
- `lua/pedram/init.lua` - Main configuration loader that requires all core modules
- `lua/pedram/settings.lua` - Vim options and editor settings
- `lua/pedram/mappings.lua` - Key mappings and leader key configuration
- `lua/pedram/augroups.lua` - Autocommands and autogroups
- `lua/pedram/mdx.lua` - MDX filetype configuration
- `lua/pedram/plugins/` - Plugin configurations (one file per plugin/feature)

### Plugin Management
- Uses Lazy.nvim as the plugin manager
- Plugins are organized in separate files under `lua/pedram/plugins/`
- Each plugin file returns a Lua table with plugin specification
- Lazy loading is configured per plugin for performance

### Key Plugins
- **LSP**: lsp-zero.nvim with Mason for language server management
- **Completion**: nvim-cmp with LuaSnip for snippets
- **Fuzzy Finding**: Telescope with fzf-native extension and extensive keymaps
- **Syntax**: nvim-treesitter with auto-install and text objects
- **Git**: gitsigns, neogit, git-blame, git-conflict with comprehensive keymaps
- **AI**: GitHub Copilot integration
- **Theme**: Tokyo Night colorscheme

## Development Workflow

### Configuration Changes
- Edit plugin configurations in `lua/pedram/plugins/`
- Restart Neovim or use `:source %` to reload changes
- Lazy.nvim will auto-install new plugins on next startup

### Plugin Management Commands
- `:Lazy` - Open Lazy.nvim UI
- `:Lazy sync` - Update/install/clean plugins
- `:Lazy profile` - View startup performance

### LSP and Formatting
- LSP servers are managed through Mason
- Auto-formatting on save is enabled for supported file types
- Pyright is specifically configured to disable organize imports

### Key Mappings Reference
- Leader key: `<Space>`
- Local leader: `\`
- File explorer: `<Leader>ex`
- Save file: `<Leader>s`

#### Telescope (Find)
- Find files: `<Leader>ff`
- Live grep: `<Leader>fg`
- Find buffers: `<Leader>fb`
- Find references: `<Leader>fr`
- Find diagnostics: `<Leader>fd`

#### Git
- Next/prev hunk: `]c` / `[c`
- Stage hunk: `<Leader>hs`
- Preview hunk: `<Leader>hp`
- Open Neogit: `<Leader>gg`
- Git commits (Telescope): `<Leader>gc`

#### Text Objects (Treesitter)
- Function: `af` / `if` (around/inside)
- Class: `ac` / `ic`
- Parameter: `aa` / `ia`
- Next/prev function: `]m` / `[m`

#### Completion & Snippets
- Accept completion: `<CR>`
- Next/prev item: `<C-n>` / `<C-p>`
- Jump in snippet: `<Tab>` / `<S-Tab>`

#### Window navigation
- Move between windows: `<C-h/j/k/l>`

## File Patterns

### Plugin Configuration Template
```lua
return {
  'plugin/name',
  dependencies = { 'dep1', 'dep2' },
  config = function()
    -- plugin setup
  end,
}
```

### Adding New Plugins
1. Create new file in `lua/pedram/plugins/`
2. Follow the plugin table structure
3. Restart Neovim to load the plugin

## Troubleshooting

### Common Issues

#### External Tools Not Found
If formatters aren't working, check tool availability:
```lua
:lua print(vim.fn.executable('ruff'))  -- Should return 1 if found
:lua print(vim.fn.executable('stylua'))  -- Should return 1 if found
```

#### Formatting Conflicts
- LSP formatting takes precedence over null-ls
- Check active formatters: `:LspInfo`
- Manual format: `<LocalLeader>f`

#### Plugin Loading Issues
- Check plugin status: `:Lazy`
- Reload config: `:source %`
- Update plugins: `:Lazy sync`

### Health Checks
Run these commands to verify configuration:
- `:checkhealth` - General Neovim health
- `:Mason` - Check LSP server status
- `:Telescope builtin` - Verify Telescope extensions

## Important Notes

- The configuration uses 4-space indentation with expandtab
- Treesitter folding is enabled by default
- Clipboard integration with system clipboard
- Auto-formatting on save with smart LSP/null-ls coordination
- MDX files are treated as markdown for syntax highlighting
- External formatters (ruff, stylua, prettier) are conditionally loaded based on availability
