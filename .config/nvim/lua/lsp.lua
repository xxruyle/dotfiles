local lspconfig = require("plugins.lsp.lspconfig")
-- blink suggestions
vim.lsp.config("*", {
	capabilities = {
		require("blink.cmp").get_lsp_capabilities(lspconfig.default_capabilities),
	},
})

vim.lsp.config("lua_ls", {
	-- Command and arguments to start the server.
	cmd = { "lua-language-server" },
	-- Filetypes to automatically attach to.
	filetypes = { "lua" },
	-- Sets the "workspace" to the directory where any of these files is found.
	-- Files that share a root directory will reuse the LSP server connection.
	-- Nested lists indicate equal priority, see |vim.lsp.Config|.
	root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
	-- Specific settings to send to the server. The schema is server-defined.
	-- Example: https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
		},
	},
})
vim.lsp.enable("lua_ls")

vim.lsp.config("clangd", {
	cmd = { "clangd" },
	filetypes = { "c", "cpp", "h", "hpp" },
})
vim.lsp.enable("clangd")

vim.lsp.config("emmet-language-server", {
	filetypes = {
		"css",
		"eruby",
		"html",
		"javascript",
		"javascriptreact",
		"less",
		"sass",
		"scss",
		"pug",
		"typescriptreact",
	},
})
vim.lsp.enable("emmet-language-server")

vim.lsp.config("beautysh", {
	filetypes = {
		"sh",
	},
})
vim.lsp.enable("beautysh")
