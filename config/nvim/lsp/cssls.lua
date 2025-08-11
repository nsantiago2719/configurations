return {
	cmd = { "vscode-css-language-server", "--stdio" },
	filetypes = { "css", "scss", "less" },
	root_markers = {
		".git",
	},
	settings = {
		css = {
			validate = true,
			lint = {
				compatibleVendorPrefixes = "ignore",
			},
			completion = {
				triggerPropertyValueCompletion = true,
			},
		},

		scss = {
			validate = true,
			lint = {
				compatibleVendorPrefixes = "ignore",
			},
			completion = {
				triggerPropertyValueCompletion = true,
			},
		},

		less = {
			validate = true,
			lint = {
				compatibleVendorPrefixes = "ignore",
			},
			completion = {
				triggerPropertyValueCompletion = true,
			},
		},
	},
}
