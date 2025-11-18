displayplacer \
"id:37D8832A-2D66-02CA-B9F7-8F30A301B230 res:1352x878 hz:120 color_depth:8 enabled:true scaling:on origin:(0,0) degree:0" \
"id:079E6536-F1A2-40EA-B33D-CC082D66791A res:1920x1080 hz:60 color_depth:8 enabled:true scaling:off origin:(1352,-98) degree:0"


ln -s wake.xml $HOME/Library/LaunchAgents/com.user.displayplacer.wake.plist

launchctl load ~/Library/LaunchAgents/com.user.displayplacer.wake.plist