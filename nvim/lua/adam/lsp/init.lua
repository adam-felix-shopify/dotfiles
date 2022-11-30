local status_ok, _ = pcall(require, "lspconfig")

if not status_ok then
	return
end

require("adam.lsp.signature")
require("adam.lsp.configs")
-- require("adam.lsp.coq")
require("adam.lsp.handlers").setup()
require("adam.lsp.null-ls")

local l_status_ok, lsp_lines = pcall(require, "lsp_lines")
if not l_status_ok then
	return
end

lsp_lines.setup()
