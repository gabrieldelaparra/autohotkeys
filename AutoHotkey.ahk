; #=Win ^=Ctrl +=Shift !=Alt

SetTitleMatchMode, RegEx

F1:: return ;Elimina F1;


+XButton1::
SendInput, ^k
SendInput, ^u
return

+XButton2::
SendInput, ^k
SendInput, ^c
return

XButton1::
SendInput,  {PgUp}
return

XButton2::
SendInput, {PgDn}
return

#+k::WrapClipText("<file:", ">")


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


$^t::
SetTitleMatchMode 2
IfWinExist Google Chrome
{
	WinActivate, Google Chrome     
	SendInput ^t
}
else
    run "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
return

~Shift::	
if (A_PriorHotkey <> "~Shift" or A_TimeSincePriorHotkey > 300)
{
	KeyWait, Shift
    return
}
send +{AppsKey} ;En teclados W540, no hay tecla AppsKey, se simula con Doble Shift
return

;PCM Application Configuration Tool
#IfWinActive ahk_class WindowsForms10.Window.8.app.0.3ce0bb8
^r:: send !ff{Enter}far ;Format>Align>Right (Control+R)
^e:: send !ff{Enter}fal ;Format>Align>Left (Control+E)
#q:: send cn ;Connect>New Variable (Windows+Q)
#e:: send ce ;Connect>Existing Variable(Windows+E)
#w:: send ch ;Connect>Hardware Module(Windows+W)
^i:: send !f{Enter}m ;Insert MainApplication Template

#z::
; Desde el PCM, con la ventana para renombrar abierta, excel en la otra pantalla.
; colocarse sobre la primera celda.
Loop, 16
{
Send {ALTDOWN}{TAB}{ALTUP} 
Send {LCtrl Down}c{LCtrl Up} 
Send {Down}
Send {ALTDOWN}{TAB}{ALTUP} 
Send {LCtrl Down}V{LCtrl Up}
Send {Enter}
}
return

;Insert Text (Windows+T) Coordenadas del boton de texto: 430,60
#t:: 
MouseGetPos, xpos, ypos 
MouseClick,,430,60,1,0,,
MouseClick,,xpos, ypos,1,0,,
return

;Find with expanded menu;
#f:: 
send ^f{Tab}{Tab}{Tab}{Tab}
send v{Enter}{Tab}{Tab}{Tab}{Tab}
return

;Replace - with _ for variable naming;
$-:: send _
$_:: send -

;PCM Parameter Settings Tool
+z:: Send {Enter}{o}{Enter} ;$On/$Off
<:: Send {Enter}{Down}{Enter} ;Enter ComboBox, Down, Close ComboBox
>:: Send {Enter}{Up}{Enter} ;Enter ComboBox, Up, Close ComboBox

;Zoom in Sheet: 125%
~LWin & 1::
{
MouseGetPos, xpos,ypos
MouseClick,Left,550,60,1,0,, 
Send {1}{2}{5}{Enter}
MouseClick,Left,%xpos% , %ypos%,1,0,,
}
return

;Zoom in Sheet: 100%
~LWin & 2::
{
MouseGetPos, xpos,ypos 
MouseClick,Left,550,60,1,0,, 
Send {1}{0}{0}{Enter}
MouseClick,Left,%xpos% , %ypos%,1,0,,
}
return

;Zoom in Sheet: 70%
~LWin & 3::
{
MouseGetPos, xpos,ypos 
MouseClick,Left,550,60,1,0,, 
Send {7}{0}{Enter}
MouseClick,Left,%xpos% , %ypos%,1,0,,
}
return

;Zoom in Sheet: 40%
~LWin & 4:: 
{
MouseGetPos, xpos,ypos
MouseClick,Left,550,60,1,0,, 
Send {4}{0}{Enter}
MouseClick,Left,%xpos% , %ypos%,1,0,,
}
return
Return ;END PCM Application Configuration Tool


;PCM Find -> Replace:
#IfWinActive, Find Nodes
!r::
MouseGetPos, xpos, ypos 
MouseClick,,307,358,1,0,,
MouseMove,xpos, ypos,0,
Send {Tab}
Return

;PCM Find Variables (Insert Existing Dialog):
#IfWinActive, Variable List
Enter:: send !s
Space:: send !s
Down:: send {Tab}
Up:: send +{Tab}
RButton::Send {LButton} !{s}
	
Return
