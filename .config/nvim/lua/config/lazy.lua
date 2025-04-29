-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "gruvbox" } },
	-- automatically check for plugin updates
	checker = { enabled = false },
})

-- vim settings
vim.cmd([[autocmd FileType * set formatoptions-=ro]])
vim.opt.cmdheight = 0 -- sets the vimline lower (also can cause problems with messages or something)
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]]) -- color scheme
vim.opt.fillchars = { eob = " " } -- remove ~ for empty lines
vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
vim.cmd([[set clipboard+=unnamedplus]]) -- clipboard stuff
vim.cmd([[set number]]) -- line number
vim.opt.cursorline = true -- buffer line for cursor
-- removes this annoying line next to numbers
vim.cmd([[set foldcolumn=0]])
vim.cmd([[set signcolumn=no]])

-- keymaps
require("config.mappings")

-- mini
require("mini.statusline").setup({
	-- Use this for function signature only, not completion
	delay = { completion = 10000000, info = 10000000, signature = 50 },
	-- Add border to signature window
	window = {
		signature = { height = 25, width = 80, border = "single" },
	},
})
-- require('mini.completion').setup()

-- neoscroll config
require("config.neoscroll-config")

-- lsp and mason
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"cssls",
		"emmet_language_server",
		"html",
		"lua_ls",
		"pyright",
		"clangd",
		"jdtls",
		"grammarly",
	},
})

require("lspconfig").pyright.setup({})
require("lspconfig").clangd.setup({})
require("lspconfig").lua_ls.setup({})
require("lspconfig").html.setup({})

require("lspconfig").emmet_language_server.setup({})
require("lspconfig").cssls.setup({})

require("lspconfig").gopls.setup({})
require("lspconfig").glslls.setup({})
require("lspconfig").jdtls.setup({})
require("lspconfig").grammarly.setup({})

local cmp = require("cmp")
cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
			-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<S-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		-- { name = "nvim_lsp_signature_help" },
		-- { name = 'vsnip'},
		{ name = "luasnip" }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = "buffer" },
	}),
})

vim.diagnostic.enable(false)

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "black" },
		-- You can customize some of the format options for the filetype (:help conform.format)
		rust = { "rustfmt", lsp_format = "fallback" },
		-- Conform will run the first available formatter
		javascript = { "prettier", stop_after_first = true },
		java = { "jdtls" },
		cpp = { "clang-format" },
		c = { "clang-format" },
		glsl = { "clang-format" },
		html = { "prettier" },
		htmldjango = { "prettier" },
		htmlangular = { "prettier" },
	},
	format_on_save = function(bufnr)
		-- Disable with a global or buffer-local variable
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end
		return { timeout_ms = 500, lsp_format = "fallback" }
	end,
})

vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		-- FormatDisable! will disable formatting just for this buffer
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})

-- mini keymapping
local imap_expr = function(lhs, rhs)
	vim.keymap.set("i", lhs, rhs, { expr = true })
end
imap_expr("<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
imap_expr("<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])

-- type writer

require("typewriter").setup({
	enable_horizontal_scroll = false,
})

-- leap
require("leap").create_default_mappings()
