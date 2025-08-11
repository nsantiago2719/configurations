return {
	cmd = { "yaml-language-server", "--stdio" },
	filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab", "yaml.helm-values", "yaml.helm" },
	root_markers = { ".git" },
	settings = {
		-- https://github.com/redhat-developer/vscode-redhat-telemetry#how-to-disable-telemetry-reporting
		redhat = { telemetry = { enabled = false } },
		yaml = {
			schemas = {
				["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/refs/heads/master/v1.33.3/all.json"] = "**/*.k8s.{yaml,yml}",
				["https://json.schemastore.org/gitlab-ci.json"] = "/*.gitlab-ci.{yaml,yml}",
				["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
			},
			schemaStore = {
				enable = false,
			},
		},
	},
}
