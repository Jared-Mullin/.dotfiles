return {
  "folke/trouble.nvim",
  config = function()
    local trouble = require('trouble')
    trouble.setup()

    vim.keymap.set('n', '<leader>xx', function() trouble.toggle() end, { desc = 'Diagnostics (Trouble)' })
  end
}
