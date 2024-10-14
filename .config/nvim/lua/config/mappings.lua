-- window pane navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left pane" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right pane" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to down pane" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to up pane" })

-- line navigation
vim.keymap.set("n", "k", "gk", { desc = "Move up" })
vim.keymap.set("n", "j", "gj", { desc = "Move down" })

-- file 
vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>qq", ":wqa<CR>", { desc = "Quit and save all open windows" })

-- bufferline
vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", { desc = "Move to next buffer" })
vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", { desc = "Move to prev buffer" })

