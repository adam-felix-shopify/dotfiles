-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

nvim_tree.setup({
	renderer = {
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					deleted = "",
					untracked = "U",
					ignored = "◌",
				},
				folder = {
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
				},
			},
		},
	},
	disable_netrw = true,
	hijack_netrw = true,
	--ignore_ft_on_setup = {
	--	"startify",
	--	"dashboard",
	--	"alpha",
	--},
	-- auto_close = true,
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = true,
	-- update_to_buf_dir = {
	--   enable = true,
	--   auto_open = true,
	-- },
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
		update_root = true,
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 500,
	},
	view = {
		width = 70,
		side = "left",
		number = false,
		relativenumber = false,
	},
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
	-- git_hl = 1,
	-- disable_window_picker = 0,
	-- root_folder_modifier = ":t",
	-- show_icons = {
	--   git = 1,
	--   folders = 1,
	--   files = 1,
	--   folder_arrows = 1,
	--   tree_width = 30,
	-- },
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
})
