return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',

    {
      'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
  },
  config = function()
    local telescope = require 'telescope'
    local builtin = require 'telescope.builtin'
    -- File and text search
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live Grep' })
    vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = 'Grep Current Word' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find Buffers' })
    vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = 'Find Old Files' })

    -- LSP and diagnostics
    vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = 'Find References' })
    vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Find Diagnostics' })
    vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = 'Find Symbols' })
    vim.keymap.set('n', '<leader>fS', builtin.lsp_workspace_symbols, { desc = 'Find Workspace Symbols' })

    -- Git
    vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Git Commits' })
    vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'Git Branches' })
    vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Git Status' })

    -- Other useful pickers
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Find Keymaps' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find Help' })
    vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = 'Find Commands' })
    vim.keymap.set('n', '<leader>ft', builtin.builtin, { desc = 'Find Telescope Builtins' })

    telescope.setup {
      defaults = {
        wrap_results = true,
        sorting_strategy = 'ascending',
        layout_strategy = 'flex',
        layout_config = {
          flex = {
            prompt_position = 'top',
          },
          horizontal = {
            preview_cutoff = 40,
          },
          vertical = {
            prompt_position = 'top',
            mirror = true,
            preview_height = 0.45,
            preview_cutoff = 40,
          },
        },
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          find_command = { 'rg', '--files', '--hidden', '--glob', '!.git/*' },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
        },
      },
    }
    require('telescope').load_extension 'fzf'
  end,
}
