return {
  {
    'laytan/tailwind-sorter.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('tailwind-sorter').setup {
        on_save_enabled = false, -- If `true`, automatically enables on save sorting.
        on_save_pattern = { '*.html', '*.js', '*.jsx', '*.tsx', '*.twig', '*.hbs', '*.php', '*.heex', '*.astro' }, -- The file patterns to watch and sort.
        node_path = 'node',
        trim_spaces = false, -- If `true`, trim any extra spaces after sorting.
      }
      -- Optional: Add a keybinding for manual sorting
      vim.keymap.set('n', '<leader>ts', ':TailwindSort<CR>', { desc = 'Sort Tailwind classes' })
    end,
  },
  -- Ensure nvim-treesitter is configured with relevant languages
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'html', 'javascript', 'typescript', 'tsx' }, -- Languages needed for tailwind-sorter
        highlight = { enable = true },
        indent = { enable = true },
      }
    end,
  },
}
