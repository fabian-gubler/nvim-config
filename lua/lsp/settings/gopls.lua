return {
	settings = {
		gopls = {
			-- Automatically imports pkgs using autocomplete
			completeUnimported = true,
			-- Adds placeholders for function parameters
			usePlaceholders = true,
			analyses = {
            -- Warning for unused params
            -- Ref: https://github.com/golang/tools/blob/master/gopls/doc/analyzers.md
				unusedparams = true,
            single_file_support = true,
			},
		},
	},
}
