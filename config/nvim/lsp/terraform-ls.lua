return {
	cmd = { "terraform-ls", "serve" },
	filetypes = { "terraform", "tf", "hcl" },
	root_markers = { ".terraform/", ".git/" },
	initializationOptions = {
		experimentalFeatures = {
			prefillRequiredFields = true,
		},
	},
	settings = {
		validateOnSave = true,
	},
}
