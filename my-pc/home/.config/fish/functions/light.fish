function light
    osascript -e 'tell application "iTerm2" to tell current session of current window to set color preset to "DX Light"'
    fish_config theme save "snow-day"
end