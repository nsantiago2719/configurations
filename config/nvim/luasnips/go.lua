return {
	s(
		{ trig = "errcheck", snippetType = "autosnippet" },
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
