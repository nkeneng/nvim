return {
	{
		"folke/noice.nvim",
		presets = {
			long_message_to_split = false,
		},
		-- enabled = false,
		popupmenu = {
			enabled = false, -- enables the Noice popupmenu UI
			-- ---@type 'nui'|'cmp'
			-- backend = "nui", -- backend to use to show regular cmdline completions
			-- ---@type NoicePopupmenuItemKind|false
			-- -- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
			-- kind_icons = {}, -- set to `false` to disable icons
		},
	}
}
