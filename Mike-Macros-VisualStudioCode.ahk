
VisualStudioCodeKeyPress(key)
{
    msgbox, in VSC %key%=
    if (key = "numDiv") 
    {
        msgbox, in divide
        Send, {Ctrl down}{Shift down}{/ down} 
        Sleep 60 
        Send, {Ctrl up}{Shift up}{/ up} 
        return
    }
    else if (key = "tab") 
    { 	
        Run, firefox.exe -new-window https://google.com/ 
        return
    } 
    else if (key = "equals") 
    { 
        msgbox, in equals
    } 
}
