local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local uv = vim.uv or vim.loop

if not uv.fs_stat(lazypath) then
  local lazy_repo = "https://github.com/folke/lazy.nvim.git"
  local result = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazy_repo,
    lazypath,
  })

  if vim.v.shell_error ~= 0 then
    error("Failed to clone lazy.nvim:\n" .. result)
  end
end

vim.opt.rtp:prepend(lazypath)

local spec = {}

if #vim.api.nvim_get_runtime_file("lua/plugins/*.lua", true) > 0 then
  spec = { { import = "plugins" } }
end

require("lazy").setup({
  spec = spec,
  change_detection = {
    notify = false,
  },
})
