return {
	s(
		{ trig = "errcheck", snippetType = "autosnippet" },
		fmt(
			[[
  if {} != nil {{
    return {}
  }}
  ]],
			{ i(1), rep(1) }
		)
	),
}
