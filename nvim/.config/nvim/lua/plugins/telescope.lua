return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require('telescope').setup()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find File' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find Buffers' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live Grep' })
    vim.keymap.set('n', '<leader>fp', '<cmd>Telescope find_files search_dirs={"~/.config/nvim"}<cr>',
      { desc = '[F]ind File in [P]rivate Config' })
  end
}
