local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

local parser_install_path = vim.fn.stdpath("data") .. "treesitter"
vim.opt.runtimepath:append(parser_install_path)

configs.setup {
<<<<<<< HEAD
  parser_install_path = parser_install_path,
=======
>>>>>>> main
  ensure_installed = "all",
  sync_install = false,
  ignore_install = { "" },
  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
}
