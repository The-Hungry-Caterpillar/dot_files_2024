-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

local surround_padding = 11

-- This is where you actually apply your config choices

-- config.font = wezterm.font("JetBrains Mono")
-- config.font = wezterm.font("SpaceMono Nerd Font", {})
config.font = wezterm.font("CommitMono Nerd Font", {})
-- config.font = wezterm.font("RecMonoLinear Nerd Font Mono", {})
-- config.font = wezterm.font("DepartureMono Nerd Font", {})
-- config.font = wezterm.font("ComicShannsMono Nerd Font", {})

config.font_size = 11

config.default_prog = { "powershell.exe" }
config.initial_cols = 80
config.initial_rows = 30

-- theme
-- config.color_scheme = "Ubuntu"
-- config.color_scheme = "Symfonic"
-- config.color_scheme = "Dracula"
-- config.color_scheme = "One Dark (Gogh)"
-- config.color_scheme = "Dracula (Gogh)"
-- config.color_scheme = "Dracula+"
config.color_scheme = "Dracula (Official)"
-- config.color_scheme = "Everforest Light (Gogh)"
-- config.color_scheme = "Everforest Dark (Gogh)"
-- config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = "Solarized (dark) (terminal.sexy)"
-- config.color_scheme = "Solarized (light) (terminal.sexy)"
-- config.color_scheme = "Solarized Dark Higher Contrast"
-- config.color_scheme = "Sequoia Moonlight"
-- config.color_scheme = "Bamboo Light"
-- config.color_scheme = "Borland"
-- config.color_scheme = "Bamboo"
-- config.color_scheme = "Nord (Gogh)"
-- config.color_scheme = "rose-pine-dawn"
-- config.color_scheme = "Gruvbox (Gogh)"
-- config.color_scheme = "rose-pine"
-- config.color_scheme = "One Light (Gogh)"
-- config.color_scheme = "Breath Light (Gogh)"
-- config.color_scheme = "Tokyo Night Storm"
-- config.color_scheme = "Tokyo Night Day"
-- config.color_scheme = "Kanagawa (Gogh)"
-- config.color_scheme = "DoomOne"
-- config.color_scheme = "Solarized Dark Higher Contrast"
-- config.color_scheme = "Mathias"
-- config.color_scheme = "ChallengerDeep"
-- config.color_scheme = "Cloud (terminal.sexy)"
-- config.color_scheme = "Ciapre (Gogh)"
-- config.color_scheme = "Snazzy"
-- config.color_scheme = "City Streets (terminal.sexy)"
-- config.color_scheme = "Cyberdyne"

config.window_decorations = "RESIZE"
-- config.window_decorations = "TITLE"
config.window_background_opacity = 1
config.window_padding = {
	left = surround_padding,
	right = surround_padding,
	top = surround_padding,
	bottom = 0,
}

config.leader = {
	key = " ",
	mods = "CTRL",
	timeout_milliseconds = 2000,
}
config.keys = {
	{
		mods = "LEADER",
		key = "c",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		mods = "LEADER",
		key = "x",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		mods = "LEADER",
		key = "H",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		mods = "LEADER",
		key = "L",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		mods = "LEADER",
		key = "v",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "s",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "h",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		mods = "LEADER",
		key = "j",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		mods = "LEADER",
		key = "k",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		mods = "LEADER",
		key = "l",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		mods = "LEADER",
		key = "LeftArrow",
		action = wezterm.action.AdjustPaneSize({ "Left", 8 }),
	},
	{
		mods = "LEADER",
		key = "DownArrow",
		action = wezterm.action.AdjustPaneSize({ "Down", 8 }),
	},
	{
		mods = "LEADER",
		key = "UpArrow",
		action = wezterm.action.AdjustPaneSize({ "Up", 8 }),
	},
	{
		mods = "LEADER",
		key = "RightArrow",
		action = wezterm.action.AdjustPaneSize({ "Right", 8 }),
	},
}

-- to navigate to tab number i
for i = 0, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = wezterm.action.ActivateTab(i),
	})
end

-- tab bar
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = true

-- little icon if leader key is active
wezterm.on("update-right-status", function(window, _)
	local SOLID_LEFT_ARROW = ""
	local ARROW_FOREGROUND = { Foreground = { Color = "#c6a0f6" } }
	local prefix = ""

	if window:leader_is_active() then
		prefix = " " .. utf8.char(0x1f30a) -- ocean wave
		SOLID_LEFT_ARROW = utf8.char(0xe0b2)
	end

	if window:active_tab():tab_id() ~= 0 then
		ARROW_FOREGROUND = { Foreground = { Color = "#1e2030" } }
	end

	window:set_left_status(wezterm.format({
		{ Background = { Color = "#282A36" } },
		{ Text = prefix },
		ARROW_FOREGROUND,
		{ Text = SOLID_LEFT_ARROW },
	}))
end)

return config
