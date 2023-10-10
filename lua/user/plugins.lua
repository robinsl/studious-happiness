local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then 
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim.git",
    install_path
  }

  print "Installing Packer... Close and reopen NeoVim..."
  vim.cmd [[packadd packer.nvim]]
end

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  use "wbthomason/packer.nvim" 
  use "nvim-lua/popup.nvim" 
  use "nvim-lua/plenary.nvim"

  -- cmp
  use "hrsh7th/nvim-cmp" 
  use "hrsh7th/cmp-buffer" 
  use "hrsh7th/cmp-path" 
  use "hrsh7th/cmp-cmdline" 
  use "saadparwaiz1/cmp_luasnip" 

  -- snippet
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'

  --use { "catppuccin/nvim", as = "catppuccin" } 
  use "folke/tokyonight.nvim"
  use "nvim-telescope/telescope.nvim"

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
