local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = { "go", "dart", "gitignore", "c_sharp", "bash", "dockerfile", "css", "html", "javascript", "json", "json5", "lua", "make", "markdown", "sql", "typescript", "yaml"},
  sync_install = false,
  ignore_install = { "" },
  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
}
