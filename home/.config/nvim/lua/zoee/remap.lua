vim.keymap.set("n", "-", vim.cmd.Ex)

-- General
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")

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

-- Paste without overwriting paste buffer
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Yank to + buffer
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Delete to void register
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Quick fix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

