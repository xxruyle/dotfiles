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

-- line number
vim.keymap.set("n", "<leader>sn", function()
	vim.cmd("set number!")
end, { desc = "Vim: set number (toggle line numbers showing)" })

-- line wrap
vim.keymap.set("n", "<leader>uw", function()
	vim.cmd("set wrap")
end, { desc = "Vim: set wrap (toggle line wrap)" })

-- clipboard
vim.keymap.set("n", "<leader>y", "+y", { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>y", "+y", { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>yy", "+yy", { desc = "Yank to system clipboard" })

-- go back to last file
-- vim.keymap.set("n", "<C-/>","<C-^>", { desc = "Go back to last file" })

-- center after ctrl u and ctrl d
-- vim.keymap.set("n", "<C-u>","<C-u>zz", {desc="Move cursor up"})
-- vim.keymap.set("n", "<C-d>","<C-d>zz", {desc="Move cursor up"})

-- lsp-config
vim.keymap.set("n", "<leader>lvt", function()
	vim.diagnostic.config({ virtual_text = false })
end, { desc = "Toggles lsp inlay hints virtual text" })
local diagnostics_active = true
vim.keymap.set("n", "<leader>lt", function()
	diagnostics_active = not diagnostics_active
	if diagnostics_active then
		vim.diagnostic.enable(false)
	else
		vim.diagnostic.enable(true)
	end
end, { desc = "Toggle diagnostics" })

-- lsp_signature diy
vim.keymap.set("n", "<leader>fs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

vim.keymap.set("i", "<c-s>", function()
	vim.lsp.buf.signature_help()
end, { buffer = true })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers["signature_help"], {
	border = "single",
	close_events = { "CursorMoved", "BufHidden", "InsertCharPre" },
})

-- lsp signature as you type
-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers["signature_help"], {
-- 	border = "single",
-- 	close_events = { "CursorMoved", "BufHidden" },
-- })
-- vim.keymap.set("i", "<leader>fs", vim.lsp.buf.signature_help)

-- Set up key mappings in your init.lua or any Lua configuration file

-- Map 'gd' to go to the local definition (LSP)
vim.keymap.set("n", "gd", function()
	vim.lsp.buf.definition()
end, { desc = "Go to definition" })

-- Map 'gD' to go to the declaration (LSP)
vim.keymap.set("n", "gD", function()
	vim.lsp.buf.declaration()
end, { desc = "Go to declaration" })
