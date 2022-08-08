require("adam.options")
require("adam.plugins")
require("adam.colorscheme")
require("adam.lsp")
require("adam.cmp")
require("adam.telescope")
require("adam.treesitter")
require("adam.autopairs")
require("adam.comments")
require("adam.gitsigns")
require("adam.nvimtree")
require("adam.lualine")
require("adam.toggleterm")
require("adam.bufferline")
require("adam.project")
require("adam.indentline")
require("adam.alpha")
require("adam.whichkey")
require("adam.highlights")
require("adam.illuminate")
require("adam.fidget")
require("adam.keymaps")

-- vim.api.nvim_set_hl(0, 'Search', { ctermbg='DarkRed', ctermfg='LightYellow', bold=true })
-- vim.api.nvim_set_hl(0, 'Whitespace', { ctermfg='LightGray' })
-- vim.api.nvim_set_hl(0, 'NonText', { ctermfg='DarkRed' })
-- vim.api.nvim_set_hl(0, 'CursorLine', { ctermfg='LightRed', underline=true}) -- fix ctermfg -> ctermbg
-- vim.api.nvim_set_hl(0, 'CursorColumn', { ctermfg='LightRed' }) -- fix ctermfg -> ctermbg
-- vim.api.nvim_set_hl(0, 'CocErrorSign', { ctermfg='Red', bold=true })
-- vim.api.nvim_set_hl(0, 'CocErrorFloat', { ctermfg='Red', ctermbg='LightRed', bold=true })
-- vim.api.nvim_set_hl(0, 'CocErrorLine', { ctermbg='LightRed', bold=true })
-- vim.api.nvim_set_hl(0, 'CocWarningSign', { ctermfg='DarkYellow', bold=true })
-- vim.api.nvim_set_hl(0, 'CocWarningLine', { ctermbg='LightYellow', bold=true })
-- vim.api.nvim_set_hl(0, 'CocWarningFloat', { ctermfg='DarkYellow', ctermbg='LightYellow', bold=true })
-- vim.api.nvim_set_hl(0, 'CocInfoSign', { ctermfg='White', bold=true })
-- vim.api.nvim_set_hl(0, 'CocInfoLine', { ctermbg='LightGrey', bold=true })
-- vim.api.nvim_set_hl(0, 'CocInfoFloat', { ctermfg='White', ctermbg='LightGrey', bold=true }) vim.api.nvim_set_hl(0, 'CocHintSign', { ctermfg='Green', bold=true })
-- vim.api.nvim_set_hl(0, 'CocHintLine', { ctermbg='LightBlue', bold=true })
-- vim.api.nvim_set_hl(0, 'CocHintFloat', { ctermfg='Green', ctermbg='LightBlue', bold=true })

-- vim.api.nvim_exec([[
-- augroup _notify
--   autocmd! * <buffer>
--   autocmd CursorHold <buffer> lua vim.notify("CursorHold")
--   autocmd CursorHoldI <buffer> lua vim.notify("CursorHoldI")
--   autocmd CursorMoved <buffer> lua vim.notify("CursorMoved")
-- augroup END
--   ]], false)
-- vim.api.nvim_command([[ autocmd CursorMoved <buffer> lua vim.notify("CursorMoved")]])
-- vim.api.nvim_command([[ autocmd CursorHold <buffer> lua vim.notify("CursorHold")]])
-- vim.api.nvim_command([[ autocmd CursorMoved <buffer> lua vim.notify("CursorMoved")]])
vim.api.nvim_exec(
	[[
      hi LspReferenceRead ctermfg=LightYellow ctermbg=DarkRed cterm=bold
      hi LspReferenceText ctermfg=Yellow ctermbg=DarkCyan cterm=bold
      hi LspReferenceWrite ctermfg=Magenta ctermbg=Black cterm=bold
    ]],
      -- augroup lsp_document_highlight
      --   autocmd!
      --   autocmd CursorHold <buffer> lua vim.notify("CursorHold")
      --   autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      --   autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
      --   autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      -- augroup END
	false
)
