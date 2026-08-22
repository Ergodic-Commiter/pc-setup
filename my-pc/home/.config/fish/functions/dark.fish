function dark
    osascript -e 'tell application "iTerm2" to tell current session of current window to set color preset to "DX Dark"'
    fish_config theme save "Breeze"
end