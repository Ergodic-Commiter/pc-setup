# Configurar outputs: 
# https://askubuntu.com/questions/1028622/different-display-scale-settings-18-04

# Configurar Wayland: 
# https://forum.manjaro.org/t/how-to-turn-on-wayland-session-on-kde-plasma-5-12/42153/7

#             Resolucion          Medidas(mm)  Medidas(Im)      DPmm         DPI 
# Samsung:     1920x1080  (16:9)    521x293    20.51x11.54   3.69x3.69   93.60x 93.62   1.69 ~ 1/0.59
# Lenovo:      1920x1080  (16:9)    309x174    12.17x 6.85   6.21x6.21  157.83x157.66*  1.00    
# Dell:        1280x1024  ( 5:4)    376x301    14.80x11.85   3.40x3.40   86.47x 86.41   1.82 ~ 1/0.55 
# ==================================================================================================
# Lenovo:  (1920,1080,158,1)  (1600, 900,131.5,0.833)  (1440,810,118,0.75)  (1280,720,105.22,0.66)  (1024,576,84.17,8/15=0.533)
# Dell:    (1280,1024, 86,1)  (1600,1280,108.09,1.25)  (1536,...)


# xrandr --dpi 276 --fb 7040x2160 --output HDMI-0 --mode 3840x2160 --pos 3200x0 --output HDMI-1 --scale 2x2 --panning 3200x1800+0+0

# 1.0x$1 + 1.5x$2 
xrandr --dpi 157 --fb 3840x1536 --output eDP-1 --mode 1920x1080 --pos 0x228 --output HDMI-2 --scale 1.5x1.5 --panning 1920x1536+1920+0

# 0.75x$1 + 1.25x$2
xrandr --dpi 118 --fb 3040x1280 --output edP-1 --mode 1440x810 --pos 0x0 --output HDMI-2 --scale 1.25x1.25 --panning 1600x1280+1440+0




