local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
  vim.notify("No Copilot")
  return
end

copilot.setup({
  suggestion = {
    auto_trigger = true,
  }
})
