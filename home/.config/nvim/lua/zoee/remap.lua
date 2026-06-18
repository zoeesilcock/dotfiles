-- Open file explorer
local open_explorer_at_current_file = function()
  vim.cmd("Ex")

  -- Restore the cursor position to the current file in the explorer.
  local file_path = vim.fn.expand('%')
  local file_name = file_path:match("[^/\\]+$")
  if (file_name ~= nil) then
    vim.cmd("call search(expand('" .. file_name .. "'))")
  end
end
vim.keymap.set("n", "-", open_explorer_at_current_file)

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

-- Quickfix lists
vim.keymap.set("n", "<C-l>", ":cnext<CR>")
vim.keymap.set("n", "<C-h>", ":cprev<CR>")

-- Since ctrl-h is backspace in insert mode, this makes ctrl-l delete.
vim.keymap.set("i", "<c-l>", "<del>", { desc = "delete" })
-- Since ctrl-j inserts a new line in insert mode, this makes ctrl-k removes a line.
vim.keymap.set("i", "<c-k>", "<Esc>ddki", { desc = "delete line" })
