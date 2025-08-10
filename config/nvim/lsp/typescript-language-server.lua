return {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "ts" },
	root_markers = {
		".git",
		"package.json",
		"package-lock.json",
	},
	settings = {
		eslint = {
			autoFixOnSave = true,
			autoFix = true,
			validate = {
				enable = true,
			},
		},
		javascript = {
			format = {
				enable = true,
				formatter = "prettier",
				prettierOptions = {
					tabWidth = 2,
					semi = true,
					singleQuote = true,
					trailingComma = "es5",
					bracketSpacing = true,
					jsxBracketSameLine = true,
				},
			},
			diagnostics = {
				enable = true,
				globals = {
					"describe",
					"it",
					"beforeEach",
					"afterEach",
					"beforeAll",
					"afterAll",
				},
			},
		},
		typescript = {
			format = {
				enable = true,
				formatter = "prettier",
				prettierOptions = {
					tabWidth = 2,
					semi = true,
					singleQuote = true,
					trailingComma = "es5",
					bracketSpacing = true,
					jsxBracketSameLine = true,
				},
			},
			diagnostics = {
				enable = true,
				globals = {
					"describe",
					"it",
					"beforeEach",
					"afterEach",
					"beforeAll",
					"afterAll",
				},
			},
			suggest = {
				autoImports = true,
			},
		},
	},
}
