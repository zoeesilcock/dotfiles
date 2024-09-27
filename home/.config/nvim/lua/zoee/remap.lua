-- Open file explorer
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

-- Tabs
vim.keymap.set("n", "<C-w>t", ":tabnew<CR>")

-- Search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste without overwriting paste register
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Yank to + buffer
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Delete to void register
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Substitute current word (all, confirm)
vim.keymap.set("n", "<leader>sa", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>sc", [[:,$s/\<<C-r><C-w>\>//gc<Left><Left><Left>]])

-- Clear search highlight
vim.keymap.set("n", "<leader>n", ":noh<CR>")

-- Neovide specific
if vim.g.neovide then
  vim.keymap.set('v', '<c-c>', '"+y') -- Copy
  vim.keymap.set('n', '<c-v>', '"+P') -- Paste normal mode
  vim.keymap.set('v', '<c-v>', '"+P') -- Paste visual mode
  vim.keymap.set('c', '<c-v>', '<C-R>+') -- Paste command mode
  vim.keymap.set('i', '<c-v>', '<ESC>l"+Pli') -- Paste insert mode
  vim.keymap.set('n', '<F11>', ':let g:neovide_fullscreen = !g:neovide_fullscreen<CR>') -- Toggle fullscreen mode
end

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