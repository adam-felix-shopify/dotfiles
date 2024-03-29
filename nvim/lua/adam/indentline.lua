local status_ok, indent_blankline = pcall(require, "ibl")
if not status_ok then
	return
end

indent_blankline.setup(
    {
        indent = {
            char = "║"
        },
        scope = {
            char = "█",
            show_start = true,
            show_end = true
        }
    }
)

--[[ vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" } ]]
--[[ vim.g.indent_blankline_filetype_exclude = { ]]
--[[ 	"help", ]]
--[[ 	"startify", ]]
--[[ 	"dashboard", ]]
--[[ 	"packer", ]]
--[[ 	"neogitstatus", ]]
--[[ 	"NvimTree", ]]
--[[ 	"Trouble", ]]
--[[ } ]]
--[[ vim.g.indentLine_enabled = 1 ]]
--[[ vim.g.indent_blankline_char = "╞" ]]
--[[ vim.g.indent_blankline_context_char = "┃" ]]
--[[ vim.g.indent_blankline_show_trailing_blankline_indent = false ]]
--[[ vim.g.indent_blankline_show_first_indent_level = true ]]
--[[ vim.g.indent_blankline_use_treesitter = true ]]
--[[ vim.g.indent_blankline_show_current_context = true ]]
--[[ vim.g.indent_blankline_strict_tabs = true ]]
--[[ vim.g.indent_blankline_context_patterns = { ]]
--[[ 	"class", ]]
--[[ 	"return", ]]
--[[ 	"function", ]]
--[[ 	"method", ]]
--[[ 	"^if", ]]
--[[ 	"^while", ]]
--[[ 	"jsx_element", ]]
--[[ 	"^for", ]]
--[[ 	"^object", ]]
--[[ 	"^table", ]]
--[[ 	"block", ]]
--[[ 	"arguments", ]]
--[[ 	"if_statement", ]]
--[[ 	"else_clause", ]]
--[[ 	"jsx_element", ]]
--[[ 	"jsx_self_closing_element", ]]
--[[ 	"try_statement", ]]
--[[ 	"catch_clause", ]]
--[[ 	"import_statement", ]]
--[[ 	"operation_type", ]]
--[[ } ]]
--[[]]
----[[ vim.cmd [[highlight IndentBlanklineIndent1 ctermfg=LightRed]] ]]
----[[ vim.cmd [[highlight IndentBlanklineIndent2 ctermfg=LightGreen]] ]]
----[[ vim.cmd [[highlight IndentBlanklineIndent3 ctermfg=LightYellow]] ]]
----[[ vim.cmd [[highlight IndentBlanklineIndent4 ctermfg=LightBlue]] ]]
----[[ vim.cmd [[highlight IndentBlanklineIndent5 ctermfg=LightMagenta]] ]]
----[[ vim.cmd [[highlight IndentBlanklineIndent6 ctermfg=Cyan]] ]]
--[[]]
--[[ indent_blankline.setup({ ]]
--[[ 	show_end_of_line = true, ]]
--[[ 	space_char_blankline = " ", ]]
--[[ 	-- show_current_context = true, ]]
--[[ 	-- show_current_context_start = true, ]]
--[[ 	char_highlight_list = { ]]
--[[ 	  "IndentBlanklineIndent1", ]]
--[[ 	  "IndentBlanklineIndent2", ]]
--[[ 	  "IndentBlanklineIndent3", ]]
--[[ 	}, ]]
--[[     show_current_context = true, ]]
--[[     show_current_context_start = true, ]]
--[[     indent_blankline_char = "»", ]]
--[[     indent_blankline_use_treesitter = true, ]]
--[[     indent_blankline_context_char = "┃" ]]
--[[ }) ]]
