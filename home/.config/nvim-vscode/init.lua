-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Mappings
vim.keymap.set("n", "<leader>w", ":Write<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "-", vim.cmd.Ex)

-- Move blocks
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Combime lines
vim.keymap.set("n", "J", "mzJ`z")

-- Navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste without overwriting paste register
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Clear search highlight
vim.keymap.set("n", "<leader>n", ":noh<CR>")

-- Allow typing distant characters from the home row.
vim.keymap.set("i", "ä ", "ä ", { desc = "ä space" })
vim.keymap.set("i", "ä<CR>", "ä<CR>", { desc = "ä enter" })
vim.keymap.set("i", "ää", "ä<Esc>", { desc = "Lone ä" })

vim.keymap.set("i", "äa", "&", { desc = "&" })
vim.keymap.set("i", "äq", "/", { desc = "/" })

vim.keymap.set("i", "äw", "''<Esc>i", { desc = "single quotes" })
vim.keymap.set("i", "äs", '""<Esc>i', { desc = "double quotes" })

vim.keymap.set("i", "äd", "()<Esc>i", { desc = "parens" })
vim.keymap.set("i", "äe", "[]<Esc>i", { desc = "brackets" })

vim.keymap.set("i", "äf", "{}<Esc>i", { desc = "curlies" })
vim.keymap.set("i", "är", "||<Esc>i", { desc = "pipes" })

vim.keymap.set("i", "äj", "@", { desc = "@" })

-- Since ctrl-h is backspace in insert mode, this makes ctrl-l delete.
vim.keymap.set("i", "<c-l>", "<del>", { desc = "delete" })


-- Options
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
