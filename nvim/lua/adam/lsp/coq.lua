local lspconfig = require("lspconfig")

-- Automatically start coq
vim.g.coq_settings = { auto_start = true }

-- Enable some language servers with the additional completion capabilities offered by coq_nvim
local servers = {
	"jsonls",
	"sumneko_lua",
	"rust_analyzer",
	"eslint",
	"graphql",
	"jdtls",
	"kotlin_language_server",
	"sourcekit",
	"tsserver",
}

for _, lsp in ipairs(servers) do
	vim.notify("asdf :: lsp :: " .. lsp)
	local server = lspconfig[lsp]
	server.setup(require("coq").lsp_ensure_capabilities({
		--on_attach = require("adam.lsp.handlers").on_attach,
	}))
end
