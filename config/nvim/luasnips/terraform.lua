return {
	s(
		"tf-terraform-state-backend-s3",
		fmt(
			[[
data "terraform_remote_state" "{}" {{
  backend = "s3"
  config = {{
    bucket         = "{}"
    key            = "{}"
    region         = "{}"
  }}
}}
    ]],
			{ i(1), i(2), i(3), i(4) }
		)
	),
}
