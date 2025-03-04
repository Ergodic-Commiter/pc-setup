

He descargado el archivo `benji_shults.json` para configurar Karabiner.  
- [Artículo de Medium][medium_shults]  
- [Gist de Github][github_shults]  

A continuación escribo mis comentarios: 
1. Formatear JSON's siempre es divertido: 
  - Quitar (paréntesis|corchetes|llaves) solitarios
  - Tratar de ordenar propiedades

2. Sobre el JSON. 
  - `global`    ✅
  - `profile`
    - `name`: mantener el anterior 
    - `selected`: igual sólo hay uno
    - `devices`: mantener el anterior
    - `fn_function_keys`: mantener el anterior
    - `simple_modifications`: combinar con el anterior
    - `complex_modifications`: revisar a fondo 
    - `parameters`: 
    - `virtual_hid_keyboard` 

3. Modificaciones complejas: 
  - Parameters ✅
  - Rules
    - Description ✅
    - Manipulators
      - `description`
      - `conditions`
      - `from` 
      - `to`
      - `type`
  
  Tenemos las siguientes reglas: 
  - Typical application control 
    - `^F`    `⌘F`
    - `^⇧?K`  `⌘K`
    - `^⌦`    `⌘⌦`


  - GUI+L to lock screen (macOS 10.13+)

  - Alt+Tab as Switch Application

  - Browser for PC keyboard

  - Windows edit shortcuts

  - Terminal Customization 

  - Slack stuff

  - Ctrl+Click selects 

  - Middle button does nothing alone  
  








[medium_shults]: https://medium.com/@benjishults/toward-cross-platform-keyboard-shortcuts-1b0f2a45256c
[github_shults]: https://gist.github.com/benjishults/a01296de370c51e744590bff49be1a57
