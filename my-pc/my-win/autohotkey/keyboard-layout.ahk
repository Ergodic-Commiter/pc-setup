#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Define the key combinations for Greek characters
; The syntax for the Send command is {key down/up}

; Se cambió [Ctrl]+[Alt] (>!g) por [L-Alt]+G (>!g) 
>!ga::Send {ASC 945}  ; α (alpha)
>!gb::Send {ASC 946}  ; β (beta)
>!gg::Send {ASC 947}  ; γ (gamma)
>!gd::Send {ASC 948}  ; δ (delta)
>!ge::Send {ASC 949}  ; ε (epsilon)
>!gz::Send {ASC 950}  ; ζ (zeta)
>!gh::Send {ASC 951}  ; η (eta)
>!gq::Send {ASC 952}  ; θ (theta)
>!gi::Send {ASC 953}  ; ι (iota)
>!gk::Send {ASC 954}  ; κ (kappa)
>!gl::Send {ASC 955}  ; λ (lambda)
>!gm::Send {ASC 956}  ; μ (mu)
>!gn::Send {ASC 957}  ; ν (nu)
>!gx::Send {ASC 958}  ; ξ (xi)
>!go::Send {ASC 959}  ; ο (omicron)
>!gp::Send {ASC 960}  ; π (pi)
>!gr::Send {ASC 961}  ; ρ (rho)
>!gs::Send {ASC 963}  ; σ (sigma)
>!gt::Send {ASC 964}  ; τ (tau)
>!gu::Send {ASC 965}  ; υ (upsilon)
>!gf::Send {ASC 966}  ; φ (phi)
>!gj::Send {ASC 967}  ; χ (chi)
>!gy::Send {ASC 968}  ; ψ (psi)
>!gw::Send {ASC 969}  ; ω (omega)


;###############################################################################
;https://stackoverflow.com/questions/29179447/create-custom-keyboard-layout-with-autohotkey-or-something-else
#include Hotstrings.ahk

lastKey := ""

; KEYS OF THE NORMAL LAYOUT WHICH SHOULD BE NEGATABLE:
hotstrings("=", "_equals")  ;

; CHOOSE LAYOUT OR NEGATE/EXPAND LAST CHARACTER:
:*?:ä::    ; backSpacePressed:  ; wtf is this? sorry just saw this now. Does not belong here, does not belong anywhere
    sendRaw *
    tooltip, 
    (
    n   normal layout
    g   greek layout
    s   set theory
    r   general math
    x   negate previous
    w   expand previous {esc}   cancel
    ), %A_CaretX%, %A_CaretY%
    input, layout, L1, {Escape}, s,r,e,g,x,w
    send {Backspace}    ; remove the *

    if layout in n,s,r,e,g,x,w {
        tooltip, %layout%, %A_CaretX%, %A_CaretY%
        ; RESET

        if layout = n { ; KEYS OF THE NORMAL LAYOUT WHICH SHOULD BE NEGATABLE:
            reset_all_hotstrings()
            hotstrings("=", "_equals")
        } else if layout = s { ; SET THEORY SHORTCUTS
            reset_all_hotstrings()
            hotstrings("o", "_emptySet")
            hotstrings("\[", "_elementOf")
        } else if layout = r { ; MATH SHORTCUTS
            reset_all_hotstrings()
            hotstrings("s", "_integral")
            hotstrings("S", "_doubleIntegral")
            hotstrings("=", "_identical")
        } else if layout = x { ; EDIT PREVIOUS CHARACTER
            send {backSpace}
            if lastKey = identical {
                sendUnicodeChar(0x2262)
            } else if lastKey = equals {
                sendUnicodeChar(0x2260)
            }
        } else if layout = w { ; EXPAND PREVIOUS CHARACTER
            send {backSpace}
            if lastKey = integral {
                sendUnicodeChar(0x222D)
            } else if lastKey = doubleIntegral {
                sendUnicodeChar(0x2A0C)
            }
        }
    } else {
        tooltip, cancelled, %A_CaretX%, %A_CaretY%
    }
    sleep, 500
    tooltip
return

reset_all_hotstrings() {
    hotstrings("=")
    hotstrings("\[")
    hotstrings("o")
    hotstrings("s")
    hotstrings("S")
}

; NORMAL LAYOUT SHORTCUTS:
_equals:
    sendUnicodeChar(0x003D)
    lastKey = equals
return


; SPECIAL LAYOUT SHORTCUTS:
_emptySet: ; sendUnicodeChar(0x00D8)
    altNumpad(0216)
        ; to find out numpad combination or unicode: press WIN+R, type in "charmap"
        ; or for unicode only, go to http://www.fileformat.info/info/unicode/category/index.htm
        ; (sendUnicodChar() needs 0x before the unicode string)
    ;altNumpad(0248)
    ;send Ø
    ;   choose whatever works best for you
    lastKey = emptySet
return

_elementOf:
    sendUnicodeChar(0x2208)
    lastKey = elementOf
return

_integral:
    sendUnicodeChar(0x222B)
    lastKey = integral
return

_identical:
    sendUnicodeChar(0x2261)
    lastKey = identical
return

_doubleIntegral:
    sendUnicodeChar(0x222C)
    lastKey = doubleIntegral
return

; -------------------------------------------

altNumpad(numbers) {
    stringSplit, n, numbers
    setkeydelay, 100
    send {alt down}
    loop, %n0% {
        t := n%a_index%
        send {numpad%t%}
    }
    send {alt up}
}


SendUnicodeChar(charCode) {
    VarSetCapacity(ki, 28 * 2, 0)
    EncodeInteger(&ki + 0, 1)
    EncodeInteger(&ki + 6, charCode)
    EncodeInteger(&ki + 8, 4)
    EncodeInteger(&ki +28, 1)
    EncodeInteger(&ki +34, charCode)
    EncodeInteger(&ki +36, 4|2)

    DllCall("SendInput", "UInt", 2, "UInt", &ki, "Int", 28)
}

EncodeInteger(ref, val) {
    DllCall("ntdll\RtlFillMemoryUlong", "Uint", ref, "Uint", 4, "Uint", val)
}

^e::reload