---@module 'hl'

--Tells hyprland to respect nwg-displays rules
require("monitors")

hl.config({
    general = {
        border_size = 0,
        gaps_in = 0,
        gaps_out = 0,
    },
})

local mainMod = "SUPER"

--Default applications

local browser = "brave"

local terminal = "foot"

local fileManager = "thunar"

local menu = "rofi -show drun -modes drun calc -theme ~/.config/rofi/launcher.rasi -hover-select -kb-element-next  -kb-mode-next Tab"

--Execution controls

hl.bind(mainMod .. " + " .. "Q", hl.dsp.exec_cmd("foot"))

hl.bind(mainMod .. " + " .. "C", hl.dsp.window.close())

hl.bind(mainMod .. " + " .. "I", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"))

hl.bind(mainMod .. " + " .. "H", hl.dsp.exec_cmd("hyprlock & sleep 1 && systemctl hibernate"))

hl.bind(mainMod .. " + " .. "E", hl.dsp.exec_cmd("thunar"))

hl.bind(mainMod .. " + " .. "V", hl.dsp.window.float())

hl.bind(mainMod .. " + " .. "R", hl.dsp.exec_cmd("rofi -show drun -modes drun calc -theme ~/.config/rofi/launcher.rasi -hover-select -kb-element-next  -kb-mode-next Tab"))

hl.bind(mainMod .. " + " .. "F", hl.dsp.exec_cmd("brave"))

--Logitech MXKeys specific keybinds

hl.bind("XF86Calculator", hl.dsp.exec_cmd("rofi -show calc -theme ~/.config/rofi/launcher.rasi"))

--minimize controls

hl.bind(mainMod .. " + " .. "S", hl.dsp.workspace.toggle_special("minimized"))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "S", hl.dsp.window.move({ workspace = "special:minimized" }, { follow = false }))

--Window managment controls

-- Window management controls
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.resize({ x = 30, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.resize({ x = -30, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.resize({ x = 0, y = -30, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.resize({ x = 0, y = 30, relative = true }), { repeating = true })

--Window rules

--These place chat and music apps on workspace CM

hl.window_rule({
    name  = "openbubbles-workspace",
    match = {
        class = "^(bluebubbles)$",
    },
    workspace = "special:CM",
    animation = "none",
})

hl.window_rule({
    name  = "signal",
    match = {
        class = "^(signal)$",
    },
    workspace = "special:CM",
})

hl.window_rule({
    name  = "sone",
    match = {
        class = "^(sone)$",
    },
    workspace = "special:CM",
})

--PIP floats and gets pinned

hl.window_rule({
    name  = "browser_pip",
    match = {
        title = "^([Pp]icture[- ]in[- ]picture|[Pp]icture-in-[Pp]icture)$",
    },
    float = 1,
    pin = 1,
    keep_aspect_ratio = 1,
})

--Enables mouse control to move and resize windows

hl.bind(mainMod .. " + " .. "mouse:272", hl.dsp.window.drag(), { mouse = true })

hl.bind(mainMod .. " + " .. "mouse:273", hl.dsp.window.resize(), { mouse = true })

--Workspace switching 1-10

hl.bind(mainMod .. " + " .. "grave", hl.dsp.workspace.toggle_special("CM"))

hl.bind(mainMod .. " + " .. 1, hl.dsp.focus({ workspace = 1 }))

hl.bind(mainMod .. " + " .. 2, hl.dsp.focus({ workspace = 2 }))

hl.bind(mainMod .. " + " .. 3, hl.dsp.focus({ workspace = 3 }))

hl.bind(mainMod .. " + " .. 4, hl.dsp.focus({ workspace = 4 }))

hl.bind(mainMod .. " + " .. 5, hl.dsp.focus({ workspace = 5 }))

hl.bind(mainMod .. " + " .. 6, hl.dsp.focus({ workspace = 6 }))

hl.bind(mainMod .. " + " .. 7, hl.dsp.focus({ workspace = 7 }))

hl.bind(mainMod .. " + " .. 8, hl.dsp.focus({ workspace = 8 }))

hl.bind(mainMod .. " + " .. 9, hl.dsp.focus({ workspace = 9 }))

hl.bind(mainMod .. " + " .. 0, hl.dsp.focus({ workspace = 10 }))

-- Move active window to a workspace with mainMod + SHIFT + [0-9]

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "grave", hl.dsp.window.move({ workspace = "special:CM" }))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 1, hl.dsp.window.move({ workspace = 1 }))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 2, hl.dsp.window.move({ workspace = 2 }))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 3, hl.dsp.window.move({ workspace = 3 }))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 4, hl.dsp.window.move({ workspace = 4 }))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 5, hl.dsp.window.move({ workspace = 5 }))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 6, hl.dsp.window.move({ workspace = 6 }))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 7, hl.dsp.window.move({ workspace = 7 }))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 8, hl.dsp.window.move({ workspace = 8 }))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 9, hl.dsp.window.move({ workspace = 9 }))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 0, hl.dsp.window.move({ workspace = 10 }))

--volume controls and playback controls

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true })

hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true })

hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })

hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })

hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Brightness control

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"), { locked = true })

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { locked = true })

-- Screenshot

hl.bind("Print", hl.dsp.exec_cmd("grim - | wl-copy"))

-- Capture a selected region to clipboard

hl.bind("SUPER + SHIFT" .. " + " .. "A", hl.dsp.exec_cmd("grim -g $(slurp) - | wl-copy"))

-- Autostart
hl.on("hyprland.start", function()
    hl.exec_cmd("dbus-update-activation-environment --systemd --all")
    hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("waybar")
    hl.exec_cmd("mako")
    hl.exec_cmd("[workspace special:CM silent] openbubbles")
    hl.exec_cmd("[workspace special:CM silent] signal-desktop")
end)
