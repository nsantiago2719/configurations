return {
	cmd = { "helm_ls", "serve" },
	filetypes = { "yaml.helm" },
	root_markers = { "Chart.yaml" },
	capabilities = {
		workspace = {
			didChangeWatchedFiles = {
				dynamicRegistration = true,
			},
		},
		textDocument = {
			completion = {
				completionItem = {
					snippetSupport = true,
				},
			},
			hover = {
				contentFormat = { "markdown", "plaintext" },
			},
			signatureHelp = {
				signatureInformation = {
					documentationFormat = { "markdown", "plaintext" },
				},
			},
		},
	},
}
