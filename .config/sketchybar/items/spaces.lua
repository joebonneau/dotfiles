-- local colors = require("colors")
-- local icons = require("icons")
-- local settings = require("settings")
-- local app_icons = require("helpers.app_icons")
--
-- local spaces = {}
--
-- for i = 1, 10, 1 do
-- 	local space = sbar.add("space", "space." .. i, {
-- 		space = i,
-- 		icon = {
-- 			font = { family = settings.font.numbers },
-- 			string = i,
-- 			padding_left = 15,
-- 			padding_right = 8,
-- 			color = colors.white,
-- 			highlight_color = colors.red,
-- 		},
-- 		label = {
-- 			padding_right = 20,
-- 			color = colors.grey,
-- 			highlight_color = colors.white,
-- 			font = "sketchybar-app-font:Regular:16.0",
-- 			y_offset = -1,
-- 		},
-- 		padding_right = 1,
-- 		padding_left = 1,
-- 		background = {
-- 			color = colors.bg1,
-- 			border_width = 1,
-- 			height = 26,
-- 			border_color = colors.black,
-- 		},
-- 		popup = { background = { border_width = 5, border_color = colors.black } },
-- 	})
--
-- 	spaces[i] = space
--
-- 	-- Single item bracket for space items to achieve double border on highlight
-- 	local space_bracket = sbar.add("bracket", { space.name }, {
-- 		background = {
-- 			color = colors.transparent,
-- 			border_color = colors.bg2,
-- 			height = 28,
-- 			border_width = 2,
-- 		},
-- 	})
--
-- 	-- Padding space
-- 	sbar.add("space", "space.padding." .. i, {
-- 		space = i,
-- 		script = "",
-- 		width = settings.group_paddings,
-- 	})
--
-- 	local space_popup = sbar.add("item", {
-- 		position = "popup." .. space.name,
-- 		padding_left = 5,
-- 		padding_right = 0,
-- 		background = {
-- 			drawing = true,
-- 			image = {
-- 				corner_radius = 9,
-- 				scale = 0.2,
-- 			},
-- 		},
-- 	})
--
-- 	space:subscribe("space_change", function(env)
-- 		local selected = env.SELECTED == "true"
-- 		local color = selected and colors.grey or colors.bg2
-- 		space:set({
-- 			icon = { highlight = selected },
-- 			label = { highlight = selected },
-- 			background = { border_color = selected and colors.black or colors.bg2 },
-- 		})
-- 		space_bracket:set({
-- 			background = { border_color = selected and colors.grey or colors.bg2 },
-- 		})
-- 	end)
-- end
--
-- local space_window_observer = sbar.add("item", {
-- 	drawing = false,
-- 	updates = true,
-- })
--
-- local spaces_indicator = sbar.add("item", {
-- 	padding_left = -3,
-- 	padding_right = 0,
-- 	icon = {
-- 		padding_left = 8,
-- 		padding_right = 9,
-- 		color = colors.grey,
-- 		string = icons.switch.on,
-- 	},
-- 	label = {
-- 		width = 0,
-- 		padding_left = 0,
-- 		padding_right = 8,
-- 		string = "Spaces",
-- 		color = colors.bg1,
-- 	},
-- 	background = {
-- 		color = colors.with_alpha(colors.grey, 0.0),
-- 		border_color = colors.with_alpha(colors.bg1, 0.0),
-- 	},
-- })
