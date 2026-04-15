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
