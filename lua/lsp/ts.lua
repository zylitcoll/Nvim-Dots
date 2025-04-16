local util = require("lspconfig/util")
return {
	root_dir = util.root_pattern("package.json", "tsconfig.json", ".git"),

	on_attach = function(client, bufnr)
		if client.server_capabilities.inlayHintProvider then
			vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
		end
	end,

	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},

	settings = {
		typescript = {
			inlayHints = {
				parameterNames = { enabled = "all" },
				variableTypes = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
			},
		},
		javascript = {
			inlayHints = {
				parameterNames = { enabled = "all" },
				variableTypes = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
			},
		},
		vtsls = {
			experimental = {
				enableProjectDiagnostics = true,
			},
		},
	},
}
