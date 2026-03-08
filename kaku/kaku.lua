local wezterm = require 'wezterm'
local act = wezterm.action
local session_manager = require 'plugins/wezterm-session-manager/session-manager'

local function resolve_bundled_config()
  local resource_dir = wezterm.executable_dir:gsub('MacOS/?$', 'Resources')
  local bundled = resource_dir .. '/kaku.lua'
  local f = io.open(bundled, 'r')
  if f then
    f:close()
    return bundled
  end

  local dev_bundled = wezterm.executable_dir .. '/../../assets/macos/Kaku.app/Contents/Resources/kaku.lua'
  f = io.open(dev_bundled, 'r')
  if f then
    f:close()
    return dev_bundled
  end

  local app_bundled = '/Applications/Kaku.app/Contents/Resources/kaku.lua'
  f = io.open(app_bundled, 'r')
  if f then
    f:close()
    return app_bundled
  end

  local home = os.getenv('HOME') or ''
  local home_bundled = home .. '/Applications/Kaku.app/Contents/Resources/kaku.lua'
  f = io.open(home_bundled, 'r')
  if f then
    f:close()
    return home_bundled
  end

  return nil
end

local config = {}
local bundled = resolve_bundled_config()

if bundled then
  local ok, loaded = pcall(dofile, bundled)
  if ok and type(loaded) == 'table' then
    config = loaded
  else
    wezterm.log_error('Kaku: failed to load bundled defaults from ' .. bundled)
  end
else
  wezterm.log_error('Kaku: bundled defaults not found')
end

-- Initialize session manager plugin
wezterm.on("save_session", function(window) session_manager.save_state(window) end)
wezterm.on("load_session", function(window) session_manager.load_state(window) end)
wezterm.on("restore_session", function(window) session_manager.restore_state(window) end)

-- User overrides:
-- Kaku intentionally keeps WezTerm-compatible Lua API names
-- for maximum compatibility, so `wezterm.*` here is expected.
--
--
-- 1) Font family and size
config.font = wezterm.font('JetBrains Mono')
config.font_size = 14.0
config.line_height = 1.5
--
--
-- 2) Color scheme
config.color_scheme = 'Vesper'
--
--
-- 3) Window size and padding
-- config.initial_cols = 120
-- config.initial_rows = 30
config.window_padding = { left = '4cell', right = '4cell', top = '2cell', bottom = '2cell' }
--
-- 4) Default shell/program
config.default_prog = { '/bin/zsh', '-l' }
--
-- 5) Cursor and scrollback
-- config.default_cursor_style = 'BlinkingBar'
-- config.scrollback_lines = 20000
--
-- 6) Add or override a key binding
table.insert(config.keys, { 
  key = "l", 
  mods = "ALT", 
  action = act.ShowLauncherArgs { 
    flags = "FUZZY|WORKSPACES" 
  }
})

table.insert(config.keys, {
    key = 'W',
    mods = 'CMD|SHIFT',
    action = act.PromptInputLine {
      description = wezterm.format {
        { Attribute = { Intensity = 'Bold' } },
        { Foreground = { AnsiColor = 'Fuchsia' } },
        { Text = 'Enter name for new workspace' },
      },
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:perform_action(
            act.SwitchToWorkspace {
              name = line,
            },
            pane
          )
        end
      end),
    },
})

wezterm.on('update-right-status', function(window, pane)
  window:set_right_status(window:active_workspace())
end)

return config
