local fn = vim.fn

local lazypath = fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  "hrsh7th/nvim-cmp",

  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",
  "saadparwaiz1/cmp_luasnip",

  'L3MON4D3/LuaSnip',
  'rafamadriz/friendly-snippets',

  "folke/tokyonight.nvim",
  "nvim-telescope/telescope.nvim",

  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  'jose-elias-alvarez/null-ls.nvim',

  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  "startup-nvim/startup.nvim"
})

