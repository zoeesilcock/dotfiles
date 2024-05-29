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

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

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

-- Zig
vim.g.zig_fmt_autosave = 0

-- Windows specific
if (vim.loop.os_uname().sysname == "Windows_NT") then
  local powershell_options = {
    shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
    shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
    shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
    shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
    shellquote = "",
    shellxquote = "",
  }


  for option, value in pairs(powershell_options) do
    vim.opt[option] = value
  end
end

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
