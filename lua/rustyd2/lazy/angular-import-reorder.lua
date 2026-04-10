-- lazy.nvim spec for angular-import-reorder.nvim
-- Add this file to: ~/.config/nvim/lua/rustyd2/lazy/angular-import-reorder.lua

return {
  dir = vim.fn.expand('~/Repos/angular_import_reorder/nvim'),
  name = 'angular-import-reorder',
  ft = { 'typescript', 'typescriptreact' },
  opts = {
    -- Set to false to suppress the "imports reordered" notification
    notify = true,
  },
}
