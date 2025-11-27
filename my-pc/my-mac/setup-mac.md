# Descripción

Intento documentar los cambios que se han hecho para configurar mi Mac.  
Lo principal son las configuraciones para que se parezca a Windows / Ubuntu, a quienes estoy acostumbrado.  

# Apps instaladas 

Las apps que se instalaron desde el inicio por equipo IT.   
- Anaconda, Docker, R, Python, Postman.  

Apps que instalé para mi uso personal son:  
- ChatGPT, Bitwarden, Brave (browser), Logi (Options)

Otras que descubrí para configurar Mac:  
- Hidden Bar, AltTab, Karabiner, Magnet, Flameshot, Witch (ya no me acuerdo para qué)
- de terminal: `brew`, `powershell`, `ports`

# _Issues_ de instalación  

- Modificar `$PATH` para reconocer `brew`.  

- Muchos fólders en `$HOME` como por ejemplo `Music`, `Movies`.  

- Firefox tiene un ícono que no _matchea_ con el resto.  Se busca cambio.  

- Algunas apps se autopermiten anclarse al Dock:  
    Slack, Outlook, VSCode, Teams, Brave, Chrome, Settings, Terminal.   

- La luminosidad viene configurada con Admin para oscurecerse todo el tiempo.  

- Los teclados han dado mucho lata:  
    - _Keyboard Type_ [`ISO` / `ANSI`]
    - Teclas mezcladas [`<>`  `|°`]

- Algunas apps requieren instalarse desde _Mac Store_, pero no existe cuenta institucional, y 
entonces hay que usar la propia.   

- Cambiamos la ubicación de _One Drive_ a 

# Usabilidad y atajos    

El uso cotidiano de Mac es ligeramente diferente que Windows/Ubuntu, y ajustarse a ello requiere de un gran esfuerzo mental.   

- La organización de _desktops_ (_spaces_) / aplicaciones / ventanas tiene muchas sutilezas.  

- Los comandos de teclado representan un verdadero recableado mental.  

- Y para esto instalé algunas de las aplicaciones arriba mencionadas.  

## Atajos  

Aunque algunas configuraciones se pueden ajustar desde _Settings_, mi objetivo es hacerlo lo más posible desde _Karabiner_ y 
las otras apps que instalé.  

0.  Cambiar `Ctrl` y `Cmd`  

Y pues los otros que necesito ir registrando para recordarme:  
- Navegación con flechas.  

- Navegación con teclado externo (Logi):  `ins`, `del`, `home`, `end`, `pgup`, `pgdn`.  

- Dock que sólo muestre las apps del _space_ actual.  

- Cambiar `~/Desktop/Screenshots` a otro lado.  
    De preferencia sería resolver cómo se usa _Flameshot_, pero en su defecto ésto.  

- Cambiar de app no necesariamente selecciona una ventana de esa app.   
    Me parece que falla cuando no hay ventanas maximizadas (o abiertas), o están en otro _space_.  





# Programas  

- **Anaconda** se instaló con usuario `root`.  Implica:  
    - Archivos de inicialización de las _shells_ se crearon con `root` también.  
    `tcsh`, `xonshrc`, `fish.config`, `bash_profile`  

- **Python** (solito) no está hecha para desarrollar con Python.   
    Para eso se requiere ya sea `conda` o la nueva favorita `pyenv`.  

- **Postman** tiene la gentileza de crear su carpeta de configuraciones en `~/Postman`,   
pero ésta es fácil de cambiar, por ejemplo a `~/Documents/Postman` .  

- Muchas apps requieren configuración adicional desde _Settings_:  
    - Karabiner, Flameshot, HiddenBar, Magnet.  

- **Flameshot** no toma _screenshots_ ante ciertas configuraciones.  
    Al parecer, si los _spaces_ los asocias independientes de cada _display_.  
    Y está difícil de resolver.  
    El nombre con minúsculas es desesperante, cambiar a `Flameshot`.  

- **Karabiner** necesita guardar su configuración en `~/.config/karabiner` y estaba mal configurado.  
    Tras ajustar a carpeta, investigamos las configuraciones que nos permiten arreglarlo.  
    Y las guardamos en `refs/my-libs/karabiner`

- **HiddenBar** no se puede configurar si tiene muchos íconos habilitados.  
    Entonces se cierran algunas apps, se configura y después se vuelven a abrir la apps.  

- **Edge** incluye la foto de perfile en la barra del título.  
    Requiere mantener presionado `[Cmd+Q]` para cerrarlo.  

# Otras 


Estas las apunté y ya no le entiendo qué eran:  

- Mac clock desktop --> `shows desktop [disable]` 

- Bitwarden: defaults to Tab instead of Vault (prob. en versión web).  
    También sugiere _identities_ equivocadamente.  

- Hubo algo de un indicador del cursor en la ruta:  
    `Library/Preferences/Features/Domain/UIKit.plist` y la instrucción,  
    `redesigned_text_cursor -dict-add Enabled -bool NO`. 
 
