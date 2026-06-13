local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"

opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

opt.wrap = false
opt.scrolloff = 4
opt.sidescrolloff = 8

opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split"

opt.splitbelow = true
opt.splitright = true

opt.termguicolors = true
opt.cursorline = true
opt.list = true
opt.listchars = {
  tab = "> ",
  trail = ".",
  nbsp = "+",
}

opt.undofile = true
opt.updatetime = 250
opt.timeoutlen = 1000

opt.mouse = "a"
opt.clipboard = "unnamedplus"

opt.completeopt = { "menu", "menuone", "noselect" }
