; #=Win ^=Ctrl +=Shift !=Alt

; Para acceder a aplicaciones por el nombre en Regex
SetTitleMatchMode, RegEx

; Elimina F1
F1:: return 

; PageDown, PageUp desde los otros botones del mouse;

XButton1::
SendInput,  {PgUp}
return

XButton2::
SendInput, {PgDn}
return

; Para los links en Lync
; #+k::WrapClipText("<file:", ">")

; Para agregar texto a la izquierda y derecha de lo que esté seleccionado.
WrapClipText(Left,Right)
{

  ClipSaved := ClipboardAll

  Clipboard =
	send ^c
	StringReplace, Clipboard, Clipboard, \, /, All
	Clipboard = %Left%%clipboard%%Right%

	send ^v

	Clipboard := ClipSaved
	ClipSaved = 

}

; Lauch new tab anywhere on Edge Browser 
$^t::
SetTitleMatchMode 2
IfWinExist Edge
{
	WinActivate, Edge     
	SendInput ^t
}
else
    run "C:\Windows\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\MicrosoftEdge.exe"
return

;En teclados W540, no hay tecla AppsKey, se simula con Doble Shift

~Shift::	
if (A_PriorHotkey <> "~Shift" or A_TimeSincePriorHotkey > 300)
{
	KeyWait, Shift
    return
}
send +{AppsKey} 
return