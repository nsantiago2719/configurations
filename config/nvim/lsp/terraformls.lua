return {
	cmd = { "terraform-ls" },
	filetypes = { "terraform", "tf", "hcl", "terraform-vars" },
	initializationOptions = {
		experimentalFeatures = {
			prefillRequiredFields = true,
		},
	},
	root_markers = {
		".git",
		".terraform",
		".terraform.lock.hcl",
	},
	settings = {
		validateOnSave = true,
	},
}
