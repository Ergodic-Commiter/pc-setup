
;;; Start Terminal with Ctrl + Alt + T
^!t::
	Run, wt.exe
return 

;;; Start Explorer with Ctrl + Alt + F
^!f::
	Run, explorer.exe C:\Users\DiegoVillamil\Library
return 

;;; Cambiar a desktop automático
;;; https://www.computerhope.com/tips/tip224.htm


;;; Mute/Unmute Microphone with Mouse button
;;; https://www.autohotkey.com/boards/viewtopic.php?t=15509
Xbutton1::
    SoundSet, +1, MASTER, MUTE, 15
    SoundGet, master_mute, , MUTE, 15
    ToolTip Mute %master_mute%
    SetTimer, RemoveToolTip, 1000
return

;;; Helper for ToolTip
RemoveToolTip:
    SetTimer, RemoveToolTip, Off
    ToolTip
return


;;; NO FUNCIONA
;;; Turn Camera On/Off 
; Xbutton2::
; return

; Los shortcuts del mouse Master MX son: 
; XButton1				(Fwrd button)
; XButton2				(Back button)
; WheelLeft/WheelRight  (Thumb wheel)
; ^!Tab::				(Gesture button)
; https://www.autohotkey.com/boards/viewtopic.php?t=65778

