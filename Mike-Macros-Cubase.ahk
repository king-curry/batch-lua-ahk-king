
CubaseKeyPress(key)
{   
    WinActivate, Cubase Pro
    ; Loop Range
    if (key = "l") 
    { 
        Send, {Ctrl down}{Alt down}{Shift down}{l down} 
        Sleep 60 
        Send, {Ctrl up}{Alt up}{Shift up}{l up} 
        return
    } 
    ; New File
    if (key = "1") 
    { 
        Send, {Ctrl down}{n down} 
        Sleep 60 
        Send, {Ctrl up}{n up} 
        return
    } 
    ; Open
    else if (key = "2") 
    { 
        Send, {Ctrl down}{o down} 
        Sleep 60 
        Send, {Ctrl up}{o up} 
        return
    } 
    ; Quit
    else if (key = "q") 
    { 
        Send, {Ctrl down}{q down} 
        Sleep 60 
        Send, {Ctrl up}{q up} 
        return
    } 
    ; Close
    else if (key = "w") 
    { 
        Send, {Ctrl down}{w down} 
        Sleep 60 
        Send, {Ctrl up}{w up} 
        return
    } 
    ; Start/Stop
    else if (key = "space") 
    { 
        Send, {Space down} 
        Sleep 60 
        Send, {Space up} 
        return
    } 
    
    ; Close All Plugins
    else if (key = "c") 
    {        
        Send, {Alt down}{c down} 
        Sleep 60 
        Send, {Alt up}{c up} 
        return
    } 
    ; Duplicate Track without Data
    if (key = "equals") 
    { 
        Send, {Alt down}{d down} 
        Sleep 60 
        Send, {Alt up}{d up} 
        return
    } 
}
