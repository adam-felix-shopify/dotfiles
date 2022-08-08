local servers = {
  "cssls",
  "cssmodules_ls",
  "jsonls",
  "sumneko_lua",
  "tsserver",
  "yamlls",
  "bashls",
  "rust_analyzer",
  "pyright",
}

local settings = {
  ui = {
    border = "rounded",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup {
  ensure_installed = servers,
  automatic_installation = true,
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}
for _, server in pairs(servers) do
	local opts = { on_attach = require("adam.lsp.handlers").on_attach,
		capabilities = require("adam.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "adam.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end
	lspconfig[server].setup(opts)
end
-- for _, server in pairs(servers) do
--   opts = {
--     on_attach = require("adam.lsp.handlers").on_attach,
--     capabilities = require("adam.lsp.handlers").capabilities,
--   }
--
--   server = vim.split(server, "@")[1]
--
--   if server == "jsonls" then
--     local jsonls_opts = require "adam.lsp.settings.jsonls"
--     opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
--   end
--
--   if server == "yamlls" then
--     local yamlls_opts = require "adam.lsp.settings.yamlls"
--     opts = vim.tbl_deep_extend("force", yamlls_opts, opts)
--   end
--
--   if server == "sumneko_lua" then
--     local l_status_ok, lua_dev = pcall(require, "lua-dev")
--     if not l_status_ok then
--       return
--     end
--     -- local sumneko_opts = require "adam.lsp.settings.sumneko_lua"
--     -- opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
--     -- opts = vim.tbl_deep_extend("force", require("lua-dev").setup(), opts)
--     local luadev = lua_dev.setup {
--       --   -- add any options here, or leave empty to use the default settings
--       -- lspconfig = opts,
--       lspconfig = {
--         on_attach = opts.on_attach,
--         capabilities = opts.capabilities,
--         --   -- settings = opts.settings,
--       },
--     }
--     lspconfig.sumneko_lua.setup(luadev)
--     goto continue
--   end
--
--   if server == "tsserver" then
--     local tsserver_opts = require "adam.lsp.settings.tsserver"
--     opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
--   end
--
--   if server == "pyright" then
--     local pyright_opts = require "adam.lsp.settings.pyright"
--     opts = vim.tbl_deep_extend("force", pyright_opts, opts)
--   end
--
--   if server == "rust_analyzer" then
--     local rust_opts = require "adam.lsp.settings.rust"
--     -- opts = vim.tbl_deep_extend("force", rust_opts, opts)
--     local rust_tools_status_ok, rust_tools = pcall(require, "rust-tools")
--     if not rust_tools_status_ok then
--       return
--     end
--
--     rust_tools.setup(rust_opts)
--     goto continue
--   end
--
-- 	local has_custom_opts, server_custom_opts = pcall(require, "adam.lsp.settings." .. server)
-- 	if has_custom_opts then
-- 		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
-- 	end
-- 	lspconfig[server].setup(opts)
--   ::continue::
-- end
--
-- -- TODO: add something to installer later
-- -- require("lspconfig").motoko.setup {}
