return {
	cmd = { "terraform-ls", "serve" },
	filetypes = { "terraform", "tf" },
	root_markers = { ".terraform/", ".git/" },
	init_options = {
		experimentalFeatures = {
			prefillRequiredFields = true,
			validateOnSave = true,
		},
	},
}
