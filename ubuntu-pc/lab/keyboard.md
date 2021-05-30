t# Tablero Keychron

El tablero Keychron viene con _bluetooth_ y con cable USB.  Tambień tiene opción de usarse
con la configuración de Windows o Mac.  

Tiene algunos problemillas en Linux: 
- No funciona el Numpad.  O sea, si está prendido no sirve los números.  Pero si se apaga 
  ya no se puede prender y desconfigura todo el tablero. 

- No funcionan bien las teclas F1, ..., F12.  
  Las que sí funcionan (con y sin fn-mod) F1, F2, F3, F10, F11, F12
  Las demás no sé, porque no estoy seguro qué hacen.  Y las de música no he probado. 

Entonces encontré este blog. 
https://schnouki.net/post/2019/how-to-use-a-keychron-k2-usb-keyboard-on-linux/

Dice que pegue esto en el archivo `/etc/modprobe.d/hid_apple.conf`.

# For Keychron keyboard -- https://wiki.archlinux.org/index.php/Apple_Keyboard
options hid_apple fnmode=2 swap_opt_cmd=1
