# Configurar outputs: 
# https://askubuntu.com/questions/1028622/different-display-scale-settings-18-04

# Configurar Wayland: 
# https://forum.manjaro.org/t/how-to-turn-on-wayland-session-on-kde-plasma-5-12/42153/7

#                        xrandr             xrandr       =mm/2.54       =res/mm        =res/In
#                                                                  =2.54xres/mm
#                    Resolucion          Medidas(mm)  Medidas(In)        DPmm         DPI        DP(I|mm)ratio
# eDP-1  Lenovo T490: 1920x1080  (16:9)    309x174    12.17x 6.85     6.21x6.21  157.83x157.66*  1.00        
# HDMI-2 ThinkVision: 1920x1080  (16:9)    527x296    20.75x11.65     3.64x3.64   92.53x 92.70   1.71 ~ 1/0.59
# Viejos: 
# ------ Samsung:     1920x1080  (16:9)    521x293    20.51x11.54     3.69x3.69   93.60x 93.62   1.69 ~ 1/0.59
# ------ Dell:        1280x1024  ( 5:4)    376x301    14.80x11.85     3.40x3.40   86.47x 86.41   1.82 ~ 1/0.55 
# ==================================================================================================

# Conf. Horizontal:  (309+527)xmax(174,296) ~ 836x296 mm2 ~ 32.92x11.65 In2  

# OPCION 1:  bajar resolución en Thinkpad, para alcanzar dimensiones. 
#   DPI (ThinkVision): 93
# ThinkPad   : (1920x1080)x0.7 ~ (1328x768 )
# ThinkVision: (1920x1080)x1.0 ~ (1920x1080)*
#   FB:  (1328+1920)x1080  ~ 3288x1080
#   POS: 0x(1080-768-GAP) ~ 0x(312-GAP)
#   PANNING: 
#   GAP: (1080-768)/2 ~ 156 | 10mm x 3.64DPmm ~ 36.4 res
#
# Not using:  SCALE, RATE, SCALE-FROM, RIGHT-OF, DPI

xrandr --dpi 93 --fb 3288x1080 \
  --output eDP-1  --mode 1368x768 --pos 0x277 --primary \
  --output HDMI-2 --mode 1920x1080 --panning 1920x1080+1368+0 

# OPCION 2:  usar la resolución más alta, y utilizar el parámetro de SCALE. 


Output: 
Screen 0: minimum 320 x 200, current 3840 x 1080, maximum 16384 x 16384
# ThinkPad T490
eDP-1 connected primary 1920x1080+0+0 (normal left inverted right x axis y axis) 309mm x 174mm
   1920x1080     60.02*   60.01    59.97    59.96    59.93    48.00  
   1368x768      59.88    59.85  
   1360x768      59.80    59.96  
   
# Extended    
   1680x1050     59.95    59.88                     |   864x486       59.92    59.57                     |
   1600x1024     60.17                              |   800x512       60.17                              |
   1400x1050     59.98                              |   700x525       59.98                              |
   1600x900      59.99    59.94    59.95    59.82   |   800x450       59.95    59.82                     |
   1280x1024     60.02                              |   640x512       60.02                              |
   1440x900      59.89                              |   720x450       59.89                              |
   1400x900      59.96    59.88                     |   700x450       59.96    59.88                     |
   1280x960      60.00                              |   640x480       60.00    59.94                     |
   1440x810      60.00    59.97                     |   720x405       59.51    58.99                     |
   1280x800      59.99    59.97    59.81    59.91   |   684x384       59.88    59.85                     |
   1152x864      60.00                              |   680x384       59.80    59.96                     |
   1280x720      60.00    59.99    59.86    59.74   |   640x400       59.88    59.98                     |
   1024x768      60.04    60.00                     |   576x432       60.06                              |
   960x720       60.00                              |   640x360       59.86    59.83    59.84    59.32   |
   928x696       60.05                              |   512x384       60.00                              |
   896x672       60.01                              |   512x288       60.00    59.92                     |
   1024x576      59.95    59.96    59.90    59.82   |   480x270       59.63    59.82                     |
   960x600       59.93    60.00                     |   400x300       60.32    56.34                     |
   960x540       59.96    59.99    59.63    59.82   |   432x243       59.92    59.57                     |
   800x600       60.00    60.32    56.25            |   320x240       60.05                              |
   840x525       60.01    59.88                     |   360x202       59.51    59.13                     |
                                                        320x180       59.84    59.32                     |
# ThinkVision
HDMI-2 connected 1920x1080+1920+0 (normal left inverted right x axis y axis) 527mm x 296mm
   1920x1080     60.00 +  50.00    59.94*  |   1280x720      60.00    50.00    59.94                    |
   1920x1080i    60.00    50.00    59.94   |   1024x768      75.03    70.07    60.00                    |
   1680x1050     59.88                     |   800x600       72.19    75.00    60.32                    |
   1280x1024     75.02    60.02            |   720x576       50.00                                      |
   1440x900      59.90                     |   720x480       60.00    59.94                             |
   1152x864      75.00                     |   640x480       75.00    72.81    66.67    60.00    59.94  |
                                           |   720x400       70.08                                      |

DP-1 disconnected (normal left inverted right x axis y axis)    # Quién sabe cuáles son estos. 
HDMI-1 disconnected (normal left inverted right x axis y axis)  # Quién sabe cuáles son estos. 
DP-2 disconnected (normal left inverted right x axis y axis)    # Quién sabe cuáles son estos. 
