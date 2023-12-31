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

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
  },

  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",
  "saadparwaiz1/cmp_luasnip",

  "L3MON4D3/LuaSnip",
  "rafamadriz/friendly-snippets",

  "folke/tokyonight.nvim",
  "nvim-telescope/telescope.nvim",

  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  'jose-elias-alvarez/null-ls.nvim',

  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  "startup-nvim/startup.nvim",
  "nvim-lualine/lualine.nvim",

  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim",        -- optional
      "ibhagwan/fzf-lua",              -- optional
    },
    config = true
  },

  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  "ahmedkhalf/project.nvim",
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function ()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },
  "folke/trouble.nvim",
})
