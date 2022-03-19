#NoEnv
SendMode Input
#InstallKeybdHook
#UseHook On
#SingleInstance force ;only one instance of this script may run at a time!
#MaxHotkeysPerInterval 2000
#WinActivateForce ;https://autohotkey.com/docs/commands/_WinActivateForce.htm
DetectHiddenWindows, Off
SetWorkingDir %A_ScriptDir%
;#Persistent ;No need, as we have hot keys

:o:att::mike.l.curry@att.net
:o:rr::I l0ve rock and roll
:o:cc::currym@us.ibm.com
:o:pp::mike9mikedrummer

; Set window title search to match any portion of title
SetTitleMatchMode, 2

;Reload this script after edit
!`::
  Reload
  Sleep 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
  return

; Start Cubase
^!c::
  Run, C:\\Program Files\\Steinberg\\Cubase 12\\Cubase12.exe
  return

; Start Cubase
^numpad0::
  run "C:\Program Files\Steinberg\Cubase 12\Cubase12.exe"
return

; Open Workouts folder
^numpad1::
  run Explorer "N:\Desktop\WORKOUTS"
return

^numpad4::
  Run, mmsys.cpl ; ms-settings:sound
return

;Run Window Spy
^numpad5::
  Run, "C:\\Program Files\\AutoHotkey\\WindowSpy.ahk"
return

;Display mouse coordinates
^numpad6::
  CoordMode, Mouse, Screen ;relative to active window
  MouseGetPos, screenX, screenY
  CoordMode, Mouse, Client ;relative to active window
  MouseGetPos, clientX, clientY
  ToolTip, % "screenX: " screenX " screenY: " screenY "  |  clientX: " clientX " clientY: " clientY
return

; Start Saffire MixControl
^numpad7::
  Run "C:\Program Files\Focusrite\Saffire MixControl\SaffireCpl.exe"
return
  
; Start VS Code with Batch loaded
^numpad8::
  SetTitleMatchMode, 2
  IfWinExist, Visual Studio Code ahk_class Chrome_WidgetWin_1
  {
    WinActivate, Visual Studio Code ahk_class Chrome_WidgetWin_1
  } else {
    Run, C:\\Users\\Mike\\AppData\\Local\\Programs\\Microsoft VS Code\\Code.exe N:\\Documents\\Batch
  }
return

; Reset Sonarworks audio
^numpad9::
  SetTitleMatchMode, 2
  IfWinExist, Reference 4 Systemwide ahk_class ContainerWindow
  {
    WinActivate, Reference 4 Systemwide ahk_class ContainerWindow
    sleep 500
    doSonarworksClicks()
  } 
  else 
  {
    Run, "C:\Program Files\Sonarworks\Reference 4\Systemwide\Reference 4 Systemwide.exe"
    num := 1
    loop {
      IfWinActive, Reference 4 Systemwide ahk_class ContainerWindow
      {
        break
      }
      sleep 200
      if (num >=30)
      {
        break
      }
      num += 1
    }
    doSonarworksClicks()
  }
return

^numpaddot::
  Run, "C:\Program Files (x86)\Line6\HX Edit\HX Edit.exe"
return

;;---------------------------------------------------------------------------
;; START MACROS KEYBOARD #1

#include Mike-Macros-VisualStudioCode.ahk
#include Mike-Macros-Cubase.ahk

F13::
FileRead, key, keypressed2.txt
  msgbox in 13: %key%

  ; Visual Studio Code
  ;IfWinActive, Visual Studio Code   ;this command is deprecated.  Use WinActive in the future
  if WinActive("Visual Studio Code")
  {
    msgbox, in code :)
    VisualStudioCodeKeyPress(key)   
    return  
  } 

  ; Cubase
  if WinActive("Cubase Pro")   ;this command is deprecated.  Use WinActive in the future
  {
    CubaseKeyPress(key)   
    return  
  }
return

F24::
FileRead, key, keypressed1.txt

  ; Visual Studio Code
  IfWinActive, Visual Studio Code   ;this command is deprecated.  Use WinActive in the future
  {
    VisualStudioCodeKeyPress(key)   
    return  
  } 

  ; Cubase
  IfWinActive, Cubase Pro   ;this command is deprecated.  Use WinActive in the future
  {
    CubaseKeyPress(key)   
    return  
  }

  #If WinActive("ahk_class SteinbergWindowClass")
  {
    CubaseKeyPress(key)   
    return   
  }

Return ;from luamacros F24
;;---------------------------------------------------------------------------
;; END MACROS KEYBOARD #1

; Clicks to reset Sonarworks audio system
doSonarworksClicks()
{
  IfWinActive, Reference 4 Systemwide ahk_class ContainerWindow
  {
    CoordMode, Mouse, Client ;relative to active window
    x:=1196
    y:=56
    Click, %x%, %y%
    Sleep 200
    Click, 1078, 109
    Sleep 400
    Click, 398, 252
    Sleep 400
    Click, 1146, 595
    Sleep 400
    Click, 1206, 14
  }
  return
}




