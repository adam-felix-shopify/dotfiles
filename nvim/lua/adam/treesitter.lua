local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = { "lua", "rust", "swift", "typescript" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	sync_installed = false, -- install languages synchronously (only applied to `ensure_installed`)
	ignore_install = { "" }, -- list of parsers to ignore installing
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of languages that will be disabled
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { "yaml" } },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages we want to disable
		extended_mode = true, -- Highlight non-bracket delimiters like html tags, boolean or table: language -> boolean
		max_file_line = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- Table of hex strings
		-- termcolors = {}, --table of colour name strings
	},
	autotag = {
		enable = true,
		disable = { "xml", "markdown" },
	},
	playground = {
		enable = true,
		-- disable = {},
		-- updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		-- persist_queries = false, -- Whether the query persists across vim sessions
		-- keybindings = {
		--     toggle_query_editor = 'o',
		--     toggle_hl_groups = 'i',
		--     toggle_injected_languages = 't',
		--     toggle_anonymous_nodes = 'a',
		--     toggle_language_display = 'I',
		--     focus_language = 'f',
		--     unfocus_language = 'F',
		--     update = 'R',
		--     goto_node = '<cr>',
		--     show_help = '?',
		-- },
	},
	textobjects = {
		select = {
			enable = true,
			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["at"] = "@class.outer",
				["it"] = "@class.inner",
				["ac"] = "@call.outer",
				["ic"] = "@call.inner",
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
				["al"] = "@loop.outer",
				["il"] = "@loop.inner",
				["ai"] = "@conditional.outer",
				["ii"] = "@conditional.inner",
				["a/"] = "@comment.outer",
				["i/"] = "@comment.inner",
				["ab"] = "@block.outer",
				["ib"] = "@block.inner",
				["as"] = "@statement.outer",
				["is"] = "@scopename.inner",
				["aA"] = "@attribute.outer",
				["iA"] = "@attribute.inner",
				["aF"] = "@frame.outer",
				["iF"] = "@frame.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>."] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>,"] = "@parameter.inner",
			},
		},
	},
})
