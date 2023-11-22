-- setup mason and mason-lspconfig for better lsp server setup
-- List of available servers: https://github.com/williamboman/mason-lspconfig.nvim
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"sumneko_lua",
		"bashls",
		"csharp_ls",
		"cssls",
		"gopls",    -- Go
		"emmet_ls", -- Emmet html
		"html",
		--"marksman", -- Markdown
		"phpactor", -- PHP
		"taplo",    -- Toml
		"yamlls",   -- Yaml
	},
})

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>d', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>l', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

require('lspconfig')['sumneko_lua'].setup{
	--cmd = {'/usr/bin/lua-language-server'},
	cmd = {'/usr/bin/lua'},
	settings = {
		Lua = {
		  diagnostics = {
			-- Get the language server to recognize the `vim` global
			globals = {'vim'},
		  },
		},
	},
}

-- automatically attach installed Servers
require("mason-lspconfig").setup_handlers({
	function (server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup {
			on_attach = on_attach,
		}
		require("lspconfig")["sumneko_lua"].setup({
			on_attach = on_attach,
			settings = { Lua = { diagnostics = { globals = {
				'vim', -- stops warn messages about "undefined global 'vim'"
			}}}}
		})
	end,
})

-- dont show diagnostic error text inline 
vim.diagnostic.config({virtual_text = false})
