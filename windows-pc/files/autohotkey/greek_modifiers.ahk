; Define the Greek modifier hotkey (Ctrl+G)
^g::
	SendInput, {Raw}% GreekModifier()
Return

; Function to map letters to Greek equivalents
GreekModifier()
{ 
	greekLetters := {
		"a": "α", "A": "Α",		; alpha 
		"b": "β", "B": "Β", 	; beta   ϐ
		"g": "ɣ", "G": "Γ", 	; gamma
		"d": "δ", "D": "Δ", 	; delta
		"e": "ε", "E": "Ε", 	; epsilon ϵ
		"z": "ζ", "Z": "Ζ", 	; zeta 
		"h": "η", "H": "Η", 	; eta
		"q": "θ", "Q": "Θ", 	; theta  ϑ
		"i": "ɩ", "I": "Ι", 	; iota 
		"k": "κ", "K": "Κ", 	; kappa  ϰ
		"l": "λ", "L": "Λ",		; lambda 
		"m": "μ", "M": "Μ",		; mu  
		"n": "ν", "N": "Ν", 	; nu 
		"x": "ξ", "X": "Ξ",		; xi 
		"o": "ο", "O": "Ο", 	; omicron
		"p": "π", "P": "Π", 	; pi     ϖ
		"r": "ρ", "R": "Ρ", 	; rho    ϱ
		"s": "σ", "S": "Σ", 	; sigma  ς
		"t": "τ", "T": "Τ",		; tau 
		"u": "υ", "U": "Υ", 	; upsilon ϒ
		"f": "ɸ", "F": "Φ", 	; phi    ϕ
		"j": "χ", "J": "Χ",		; ji 
		"y": "ψ", "Y": "Ψ",		; psi 
		"w": "ω", "W": "Ω",		; omega
	}
	Input, letter, L1, {Backspace}{Enter}		; Wait for the next letter key or allow backspace/enter

	; Check if the letter is present in the lookup table, return the Greek equivalent if found
	if greekLetters.HasKey(letter)
		return greekLetters[letter]
	else
		return letter ; If no Greek equivalent found, return the original letter
}
