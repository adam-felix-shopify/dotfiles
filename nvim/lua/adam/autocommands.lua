vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	-- pattern = { "*.ts" },
	callback = function()
		vim.lsp.buf.format({ async = true })
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "*.ts", "*.js", "*.jsx", "*.tsx", "*.graphql", "*.gql", "*.json" },
	callback = function()
		vim.opt.expandtab = true
		vim.opt.tabstop = 2
		vim.opt.softtabstop = 2
		vim.opt.shiftwidth = 2
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "*.rust", "*.markdown", "*.md" },
	callback = function()
		vim.opt.expandtab = true
		vim.opt.tabstop = 4
		vim.opt.softtabstop = 4
		vim.opt.shiftwidth = 4
	end,
})
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "*.swift" },
	callback = function()
		vim.opt.expandtab = false
		vim.opt.tabstop = 4
		vim.opt.softtabstop = 4
		vim.opt.shiftwidth = 4
		vim.g.indent_blankline_char = "»"
	end,
})

vim.cmd([[autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll]])
