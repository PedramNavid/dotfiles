return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'L3MON4D3/LuaSnip' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'onsails/lspkind.nvim' },
  },

  config = function()
    local cmp = require 'cmp'
    local cmp_buffer = require 'cmp_buffer'
    local lspkind = require 'lspkind'

    -- Set highlight for completion ghost text
    vim.api.nvim_set_hl(0, 'CmpGhostText', { link = 'Comment', default = true })

    -- Helper function to check if there are words before cursor (for tab completion)
    local has_words_before = function()
      if vim.bo.buftype == 'prompt' then return false end
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match '^%s*$' == nil
    end
    lspkind.init {
      symbol_map = {
        Copilot = '',
      },
    }
    vim.api.nvim_set_hl(0, 'CmpItemKindCopilot', { fg = '#6CC334' })

    -- Load LuaSnip
    local luasnip = require 'luasnip'

    cmp.setup {
      -- Configure snippet expansion
      snippet = {
        expand = function(args) luasnip.lsp_expand(args.body) end,
      },
      formatting = {
        format = lspkind.cmp_format {
          mode = 'symbol',
          maxwidth = 50,
        },
      },
      -- Completion sources in priority order
      sources = {
        { name = 'copilot' }, -- AI completions first
        { name = 'luasnip' }, -- Snippet completions
        { name = 'nvim_lsp' }, -- LSP completions
        { name = 'buffer', option = { keyword_length = 3 } }, -- Buffer text (min 3 chars)
        { name = 'path' }, -- File paths
      },
      sorting = {
        priority_weight = 2,
        comparators = {
          require('copilot_cmp.comparators').prioritize,
          cmp.config.compare.offset,
          function(...) return cmp_buffer:compare_locality(...) end,
          cmp.config.compare.exact,
          cmp.config.compare.score,
          cmp.config.compare.recently_used,
          cmp.config.compare.locality,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
      mapping = {
        ['<cr>'] = cmp.mapping.confirm { select = false },
        ['<C-n>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
        ['<C-p>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
        ['<c-f>'] = cmp.mapping.scroll_docs(4),
        ['<c-b>'] = cmp.mapping.scroll_docs(-4),
        ['<c-space>'] = cmp.mapping.complete(),
        ['<c-e>'] = cmp.mapping.abort(),
        ['Tab'] = vim.schedule_wrap(function(fallback)
          if cmp.visible() and has_words_before() then
            cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end),
        ['<S-Tab>'] = vim.schedule_wrap(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item { behavior = cmp.SelectBehavior.Select }
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end),
      },
    }
  end,
}
