local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.opt.syntax = "on"
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = ""
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.wo.wrap = false
vim.g.python3_host_prog = "/usr/bin/python3"
vim.env.PATH = vim.env.PATH .. ':/usr/local/bin'
vim.opt.showmode = false
vim.opt.ignorecase = true
-- misc shortcuts
vim.keymap.set("n", "<leader>x", ":bd<CR>", {noremap = true, silent = true, desc = "Close buffer"})
vim.keymap.set("n", "<leader>t", ":bot terminal<CR>i", {noremap = true, silent = true, desc = "Use terminal"})
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
vim.keymap.set("n", "w", ":write<CR>", {noremap = true, silent = true, desc = "Write to file"})
vim.keymap.set("n", "q", ":quit<CR>", {noremap = true, silent = true, desc = "Quit"})
vim.keymap.set("n", "Q", ":quitall!<CR>", {noremap = true, silent = true, desc = "Force quit"})
vim.keymap.set({ "n", "v" }, "x", '"_x', { noremap = true, silent = true })
vim.keymap.set("n", "X", '"_X', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>vs", function() require("vite").start() end, {noremap = true, silent = true, desc = "Start Vite in working directory"})
vim.keymap.set("n", "<leader>vx", function() require("vite").stop() end, {noremap = true, silent = true, desc = "Start Vite in working directory"})
-- switching windows
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", {noremap = true, silent = true})
-- moving windows
vim.keymap.set("n", "<leader>wj", ":wincmd J<CR>", { silent = true })
vim.keymap.set("n", "<leader>wk", ":wincmd K<CR>", { silent = true })
vim.keymap.set("n", "<leader>wh", ":wincmd H<CR>", { silent = true })
vim.keymap.set("n", "<leader>wl", ":wincmd L<CR>", { silent = true })
-- resizing windows
vim.keymap.set("n", "<leader>wr-", ":resize -2<CR>", { silent = true })
vim.keymap.set("n", "<leader>wr=", ":resize +2<CR>", { silent = true })
vim.keymap.set("n", "<leader>wv-", ":vertical resize -2<CR>", { silent = true })
vim.keymap.set("n", "<leader>wv=", ":vertical resize +2<CR>", { silent = true })

-- Plugin setup
require("lazy").setup({
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
          bigfile = { enabled = true },
          quickfile = { enabled = true },
          statuscolumn = { enabled = true },
          picker = { enabled = true },
          dashboard = { enabled = true},
          image = {
            enabled = false,
            doc = {
              inline = false,
            },
            hover = {
              enabled = false,
            },
            formats = {
              "png", "jpg", "jpeg", "gif", "bmp", "webp", "tiff", "heic", "avif",
              "mp4", "mov", "avi", "mkv", "webm", "pdf",
            },
          },
          indent = { enabled = true},
        },
        keys = {
          { "<leader>ff", function() Snacks.picker.files() end, desc = "Snacks files picker" },
          { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Snacks buffer picker" },
          { "<leader>fg", function() Snacks.picker.grep() end, desc = "Snacks grep picker" },
        },
    },
    {
        "echasnovski/mini.nvim",
        version = false,
        config = function()
            require("mini.comment").setup({})
            require("mini.move").setup({})
            require("mini.pairs").setup({})
            require("mini.clue").setup({})
            require("mini.completion").setup({
                mappings = {
                    next_item = "<Down>",
                    previous_item = "<Up>",
                }
            })
            require("mini.snippets").setup({})
            require("mini.icons").setup({})
            require("mini.git").setup({})
            require("mini.statusline").setup({})
        end,
    },
    {
      "neovim/nvim-lspconfig",
      event = { "BufReadPre", "BufNewFile" },
      config = function()
        require("lspconfig").pyright.setup({})
        require("lspconfig").gopls.setup({})
        require("lspconfig").cssls.setup({})
        require("lspconfig").html.setup({})
        require("lspconfig").jsonls.setup({})
        require("lspconfig").ts_ls.setup({})
        require("lspconfig").rust_analyzer.setup({})
      end,
    },
    {
      "nvim-treesitter/nvim-treesitter",
    },
    {
      "mikavilpas/yazi.nvim",
      version = "*",
      event = "VeryLazy",
      dependencies = { "nvim-lua/plenary.nvim", lazy = true },
      opts = {
        open_for_directories = true,
        keymaps = { show_help = "<f1>" },
      },
      init = function()
        vim.g.loaded_netrwPlugin = 1
      end,
    }
}, {})

