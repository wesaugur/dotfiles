-- Mouse Follows Focus: Set mouse pointer to center of focused window on change

mouseFollowsFocus = hs.window.filter.new()
mouseFollowsFocus:subscribe(hs.window.filter.windowFocused, function(win)
  if not win then return end

  local f = win:frame()
  hs.mouse.absolutePosition({
    x = f.x + f.w / 2,
    y = f.y + f.h / 2,
  })
end)


-- ChatGPT + Superwhisper

local KEY = "f1"  -- NOTE: f14 is Scroll Lock key on Mac Kinesis Freestyle Pro
local URL = "https://chatgpt.com/"
local CHROME = "com.google.Chrome"

local run = 0
local recording = false

local function after(sec, id, fn)
  hs.timer.doAfter(sec, function()
    if id == run then fn() end
  end)
end

local function openChatGPT()
  hs.osascript.applescript(([[
    tell application "Google Chrome"
      activate
      if (count of windows) = 0 then make new window
      make new tab at end of tabs of front window with properties {URL:"%s"}
      set active tab index of front window to (count of tabs of front window)
    end tell
  ]]):format(URL))
end

local function focusComposer()
  hs.application.launchOrFocusByBundleID(CHROME)
  hs.timer.doAfter(0.05, function()
    hs.eventtap.keyStroke({ "shift" }, "escape", 0)
  end)
end

hs.hotkey.bind({}, KEY,
  function()
    run = run + 1
    local id = run
    recording = true

    hs.urlevent.openURL("superwhisper://record")
    after(0.05, id, openChatGPT)
    after(0.80, id, focusComposer)
  end,

  function()
    local id = run
    if not recording then return end
    recording = false

    hs.urlevent.openURL("superwhisper://record")
    after(0.20, id, focusComposer)
  end
)
