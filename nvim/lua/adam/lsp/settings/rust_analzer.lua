local util = require("lspconfig.util")

local function reload_workspace(bufnr)
	bufnr = util.validate_bufnr(bufnr)
	vim.lsp.buf_request(bufnr, "rust-analyzer/reloadWorkspace", nil, function(err)
		if err then
			error(tostring(err))
		end
		vim.notify("Cargo workspace reloaded")
	end)
end



local opts = {
	settings = {
		["rust-analyzer"] = {
			assist = {
				expressionFillDefault = "todo",
			},
			cachePriming = {
				enable = true,
				numThreads = 0,
			},
			cargo = {
				autoreload = true,
				buildScripts = {
					enable = true,
					overrideCommand = nil,
					useRustcWrapper = true,
				},
				features = {},
				noDefaultFeatures = false,
				noSysroot = false,
				target = nil,
				unsetTest = { "core" },
				checkOnSave = {
					allTargets = true,
					command = "check",
					enable = true,
					extraArgs = {},
					features = nil,
					noDefaultFeatures = nil,
					overrideCommand = nil,
					target = nil,
				},
				completion = {
					autoimport = {
						enable = true,
					},
					autoself = {
						enable = true,
					},
					callable = {
						snippets = "fill_arguments",
					},
					postfix = {
						enable = true,
					},
					privateEditable = {
						enable = false,
					},
					-- snippets.custom default is a JSON
					-- and i don't know how to represent that in
					-- snippets = {
					--  custom = {
					--  },
				},
				diagnostics = {
					disabled = {},
					enable = true,
					experimental = {
						enable = false,
					},
					remapPrefix = {},
					warningsAsHint = {},
					warningsAsInfo = {},
				},
				files = {
					excludeDirs = {},
					watcher = "client",
				},
				highlightRelated = {
					breakPoints = {
						enable = true,
						exitPoints = {
							enable = true,
						},
						references = {
							enable = true,
						},
						yieldPoints = {
							enable = true,
						},
					},
				},
				hover = {
					actions = {
						debug = {
							enable = true,
						},
						enable = true,
						gotoTypeDef = {
							enable = true,
						},
						implementations = {
							enable = true,
						},
						references = {
							enable = false,
						},
						run = {
							enable = true,
						},
					},
					documentation = {
						enable = true,
					},
					links = {
						enable = true,
					},
				},
				imports = {
					granularity = {
						enforce = false,
						group = "crate",
					},
					group = {
						enable = true,
					},
					merge = {
						glob = true,
					},
					prefix = "plain",
				},
				inlayHints = {
					bindingModeHints = {
						enable = true,
					},
					chainingHints = {
						enable = true,
					},
					closingBraceHints = {
						enable = true,
						minLines = 25,
					},
					closureReturnTypes = {
						enable = "never",
					},
					lifetimeElisionHints = {
						enable = "never",
						useParameterNames = false,
					},
					maxLength = 25,
					parameterHints = {
						enable = true,
					},
					reborrowHints = {
						enable = "never",
					},
					renderColons = {
						enable = true,
					},
					typeHints = {
						enable = true,
						hideClosureInitialization = false,
						hideNamedConstructor = false,
					},
				},
				joinLines = {
					joinAssignments = true,
					joinElseIf = true,
					removeTrailingComma = true,
					unwrapTrivialBlock = true,
				},
				lens = {
					debug = {
						enable = true,
					},
					enable = true,
					forceCustomCommands = true,
					implementations = {
						enable = true,
					},
					references = {
						adt = {
							enable = false,
						},
						enumVariant = {
							enable = false,
						},
						method = {
							enable = false,
						},
						trait = {
							enable = false,
						},
						run = {
							enable = true,
						},
					},
				},
				linkedProjects = {},
				lru = {
					capacity = nil,
				},
				notifications = {
					cargoTomlNotFound = true,
				},
				procMacro = {
					attributes = {
						enable = true,
					},
					enable = true,
					ignored = {},
					server = nil,
				},
				runnables = {
					command = nil,
					extraArgs = {},
				},
				rustc = {
					source = nil,
				},
				rustfmt = {
					extraArgs = {},
					overrideCommand = nil,
					rangeFormatting = {
						enable = false,
					},
				},
				semanticHighlighting = {
					strings = {
						enable = true,
					},
				},
				signatureInfo = {
					detail = "full",
					documentation = {
						enable = true,
					},
				},
				typing = {
					autoClosingAngleBrackets = {
						enable = false,
					},
				},
				workspace = {
					symbol = {
						search = {
							kind = "only_types",
							limit = 128,
							scope = "workspace",
						},
					},
				},
			},
		},
	},
}

return opts
