-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

-- Default indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- Undo
local home = os.getenv("HOME")
if home == nil or home == "" then home = os.getenv("USERPROFILE") end
vim.opt.undodir = home .. "/.vim/undodir"
vim.opt.backupdir = home .. "/.vim/backupdir"
vim.opt.undofile = true
vim.opt.swapfile = false

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "120"

vim.g.mapleader = " "

-- Netrw
vim.g.netrw_bufsettings = "noma nomod nu nobl nowrap ro"

-- Rust
vim.g.rustfmt_autosave = 1

-- Neovide specific
if vim.g.neovide then
  vim.g.neovide_scroll_animation_length = 0.1

  if (vim.loop.os_uname().sysname == "Darwin") then
    vim.o.guifont = "FiraMono Nerd Font:h18:sb"
  else
    vim.g.neovide_fullscreen = true
    vim.o.guifont = "FiraMono Nerd Font:h12:sb"
  end
end
