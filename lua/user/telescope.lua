local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local project_status_ok, project = pcall(require, "project_nvim")
if not project_status_ok then
  return
end

telescope.load_extension('projects')

telescope.setup {}
project.setup({})
