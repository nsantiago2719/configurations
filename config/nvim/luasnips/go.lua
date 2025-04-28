return {
	s(
		"errcheck",
		fmt(
			[[
  if err != nil {{
    return {}
  }}
  ]],
			i(1)
		)
	),
}
