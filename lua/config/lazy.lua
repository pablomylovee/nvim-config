-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.mouse = ""
vim.opt.number = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.wrap = false
vim.opt.showmode = false
vim.o.clipboard = 'unnamedplus'

-- Hotkeys
vim.keymap.set("n", "f", ":lua Snacks.picker.files()<CR>", {silent = true, noremap = true})
vim.keymap.set("n", "q", ":lua Snacks.dashboard()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "Q", ":q<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "w", ":w<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "W", ":w ", {noremap = true, silent = false})
vim.keymap.set("n", "r", "<C-r>", {noremap = true, silent = true})
vim.keymap.set('n', 'x', '"_x', { noremap = true, silent = true })
vim.keymap.set('v', 'x', '"_x', { noremap = true, silent = true })
vim.keymap.set('n', 'g', '<cmd>lua require("snacks").picker.grep()<CR>', { silent = true, noremap = true })

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },

  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})

