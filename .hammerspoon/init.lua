local hyper = {"ctrl", "alt", "cmd", "shift"}

hs.loadSpoon("MiroWindowsManager")

hs.window.animationDuration = 0
spoon.MiroWindowsManager:bindHotkeys({
  down = {hyper, "down"},
  right = {hyper, "right"},
  left = {hyper, "left"},
  up = {{"ctrl", "alt", "cmd"}, "up"},
  fullscreen = {hyper, "up"}
})

hs.hotkey.bind(hyper, "R", function()
  hs.reload()
  hs.notify.new({title="Hammerspoon config reloaded", informativeText="Manually via keyboard shortcut"}):send()
end)


-- Taken
-- Hyper+P = 1password

hs.hotkey.bind(hyper, 'A', function () hs.application.launchOrFocus("Google Chrome") end)
hs.hotkey.bind(hyper, 'B', function () hs.application.launchOrFocus("Electron") end)
hs.hotkey.bind(hyper, 'C', function () hs.application.launchOrFocus("Calendar") end)
hs.hotkey.bind(hyper, 'D', function () hs.application.launchOrFocus("Figma") end)
hs.hotkey.bind(hyper, 'E', function () hs.application.launchOrFocus("Visual Studio Code") end)
hs.hotkey.bind(hyper, 'F', function () hs.application.launchOrFocus("Finder") end)
hs.hotkey.bind(hyper, 'G', function () hs.application.launchOrFocus("Telegram") end)
hs.hotkey.bind(hyper, 'M', function () hs.application.launchOrFocus("Spotify") end)
hs.hotkey.bind(hyper, 'S', function () hs.application.launchOrFocus("Discord") end)
hs.hotkey.bind(hyper, 'T', function () hs.application.launchOrFocus("Microsoft To Do") end)
hs.hotkey.bind(hyper, 'W', function () hs.application.launchOrFocus("WhatsApp") end)
hs.hotkey.bind(hyper, 'Z', function () hs.application.launchOrFocus("zoom.us") end)

hs.hotkey.bind(hyper, '0', function ()
  local resp = hs.execute("blockstack-cli make_keychain -t | jq -r .keyInfo.address", true)
  hs.eventtap.keyStrokes(resp)
end)

function toggleFullScreen(s)
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = s or win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end

function moveWindowNext()
  local s = hs.screen.mainScreen():next()
  toggleFullScreen(s)
end

function moveWindowPrev()
  local s = hs.screen.mainScreen():previous()
  toggleFullScreen(s)
end

hs.hotkey.bind(hyper, "N", moveWindowNext)
