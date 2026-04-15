-- Mouse Follows Focus: Set mouse pointer to center of focused window on change

local wf = hs.window.filter

mouseFollowsFocus = wf.new()

mouseFollowsFocus:subscribe(wf.windowFocused, function(win)
  if not win then return end

  local f = win:frame()
  hs.mouse.absolutePosition({
    x = f.x + f.w / 2,
    y = f.y + f.h / 2,
  })
end)


-- ChatGPT + Superwhisper

local KEY = "f1"  -- f14 is Scroll Lock key on Mac Kinesis Freestyle Pro

local CHROME = "com.google.Chrome"
local URL = "https://chatgpt.com/"

local held = false
local recording = false
local run = 0

local T = {
  openTab = 0.05,   -- start opening ChatGPT almost immediately
  focus1  = 0.75,   -- first chance to focus the composer while you're talking
  focus2  = 1.10,   -- second chance in case Chrome/ChatGPT is a little slower
  stop1   = 0.15,   -- first post-stop focus nudge for Superwhisper auto-paste
  stop2   = 0.40,   -- second post-stop focus nudge
}

local function tap(mods, key)
  hs.eventtap.keyStroke(mods, key, 0)
end

local function after(sec, id, fn)
  hs.timer.doAfter(sec, function()
    if id == run then fn() end
  end)
end

local function focusComposer()
  hs.application.launchOrFocusByBundleID(CHROME)
  hs.timer.doAfter(0.05, function()
    tap({ "shift" }, "escape") -- ChatGPT composer focus shortcut that worked for you
  end)
end

local function openChatGPT()
  hs.application.launchOrFocusByBundleID(CHROME)
  hs.timer.doAfter(0.05, function()
    hs.osascript.applescript(([[
      tell application "Google Chrome"
        activate
        if (count of windows) = 0 then make new window
        make new tab at end of tabs of front window with properties {URL:"%s"}
        set active tab index of front window to (count of tabs of front window)
      end tell
    ]]):format(URL))
  end)
end

hs.hotkey.bind({}, KEY,
  function()
    run = run + 1
    local id = run
    held = true
    recording = true

    hs.urlevent.openURL("superwhisper://record") -- start recording immediately
    after(T.openTab, id, openChatGPT)
    after(T.focus1, id, function() if held then focusComposer() end end)
    after(T.focus2, id, function() if held then focusComposer() end end)
  end,

  function()
    local id = run
    held = false
    if not recording then return end

    recording = false
    hs.urlevent.openURL("superwhisper://record") -- stop recording
    after(T.stop1, id, focusComposer)
    after(T.stop2, id, focusComposer)
  end
)
