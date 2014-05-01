/*
CustomKey for Warcraft III
--------------------------
Developed on: Autohotkey 1.1.14.04 ANSI
Language    : Traditional Chinese / English
Version     : 2.7 (2009-10-11)
=======================================================================
                      This software is FREEWARE
                      -------------------------
If this software works, it was surely written by Chang Yu-heng (張昱珩)
                   <http://changyuheng.github.io/>
           (If it doesn't, I don't know anything about it.)
=======================================================================

----------------------------------------------------------------------------------
Instruction
----------------------------------------------------------------------------------
     This program can remap the hotkeys in Warcraft III, make Alt+Tab or Windows
Logo Key to be null.
    本程式能讓您重新設定魔獸爭霸3的熱鍵。亦可自動持續顯示生命值條，
開啟或關閉 Alt 組合鍵功能、視窗鍵功能。

     This program is free software; you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation; either version 2 of the License, or (at your option) any later version
.
    這是一支免費程式。你可以任意地散佈；也可以在 GNU 的規範下重新編寫、修改程式。

P.S: 本程式為一外掛，使用與否請自行斟酌。
     但根據 http://warkeys.sourceforge.net/faq.php  中之解釋，本程式不違反公平原則
     ，理論上能在 Battle.net 與 Garena 中合法使用。
*/

; --------------------------------------------------------------------------------
; Variables definitions
; --------------------------------------------------------------------------------
; String_* = strings
; Number_* = number strings
; Status_* = status variables ( 0/1 )
; Function_* = function
; Label_* = label
; Key_* = key
; KeyAction_* = key action
; KeyDescription_* = key action description
; Version = version

; --------------------------------------------------------------------------------
;  Directives
; --------------------------------------------------------------------------------
; DetectHiddenWindows on
; #InstallKeybdHook
; #HotkeyInterval 1000
; #MaxHotkeysPerInterval 200
#Persistent   ; Keeps a script permanently running (that is, until the user closes it or ExitApp is encountered).
#SingleInstance force   ; The word FORCE skips the dialog box and replaces the old instance automatically, which is similar in effect to the Reload command.
FileInstall, PeonReady1.wav, PeonReady1.wav, 0
FileInstall, War3CustomkeyReadme.txt, War3CustomkeyReadme.txt, 0
FileInstall, War3Customkey.ini, War3Customkey.ini, 0
FileInstall, image.png, image.png, 1
SetTitleMatchMode, 3   ; A window's title must exactly match WinTitle to be a match.
SetScrollLockState, Off

; --------------------------------------------------------------------------------
; Variables
; --------------------------------------------------------------------------------
Version := "2.7"
;VersionDate := "Tuesday, February 2nd, 2010, Sunny"
VersionDate := "中華民國 103 年 5 月 1 日"
Author := "張昱珩"
Status_Working = 0

; --------------------------------------------------------------------------------
; Load Variables from "War3Customkey.ini"
; --------------------------------------------------------------------------------
IniRead, Status_Blood, War3Customkey.ini, Configure, Status_Blood, %A_Space%
IniRead, Status_Left_AltTab, War3Customkey.ini, Configure, Status_Left_AltTab, %A_Space%
IniRead, Status_Right_AltTab, War3Customkey.ini, Configure, Status_Right_AltTab, %A_Space%
IniRead, Status_LWin, War3Customkey.ini, Configure, Status_LWin, %A_Space%
IniRead, Status_RWin, War3Customkey.ini, Configure, Status_RWin, %A_Space%
IniRead, Key_Toggle, War3Customkey.ini, Configure, Key_Toggle, %A_Space%

If Key_Toggle =
{
  IniWrite, ScrollLock, War3Customkey.ini, Configure, Key_Toggle
  Key_Toggle := ScrollLock
}

Loop, 37
{
  IniRead, Key_%A_Index%, War3Customkey.ini, KeyMapping, Key_%A_Index%, %A_Space%
  IniRead, KeyAction_%A_Index%, War3Customkey.ini, KeyMapping, KeyAction_%A_Index%, %A_Space%
  IniRead, KeyDescription_%A_Index%, War3Customkey.ini, KeyMapping, KeyDescription_%A_Index%, %A_Space%
}

; --------------------------------------------------------------------------------
; Tray Icon
; --------------------------------------------------------------------------------
Menu, Tray, NoStandard
Menu, Tray, Tip, War3CustomKey
; Menu, Tray, Add, Turn On  (%Key_Toggle%), Label_Toggle
Menu, Tray, Add, 啟動 (%Key_Toggle%), Label_Toggle
; Menu, Tray, Add, &Show Control Panel, Label_Tray_Show_Hide_Main_GUI
Menu, Tray, Add, 隱藏控制視窗, Label_Tray_Show_Hide_Main_GUI
; Menu, Tray, Add, E&xit, Label_Tray_Close
Menu, Tray, Add, 結束, Label_Tray_Close
; Menu, Tray, Default, &Show Control Panel
Menu, Tray, Default, 隱藏控制視窗
Menu, Tray, Click, 1
; TrayTip, War3Customkey %Version%, It's working., 10, 1
TrayTip, War3Customkey %Version%, 執行中, 10, 1

; --------------------------------------------------------------------------------
; Main GUI
; --------------------------------------------------------------------------------
Status_GUI = 1
Gui, Font, s12 Bold, Georgia

Gui, Add, Picture, x0 y0, image.png

; Graphical User Interface Box
; Gui, Add, GroupBox, x15 y8 w200 h150 cBlack, Options
; Gui, Add, GroupBox, x+15 w300 h150 cBlack,
; Gui, Add, GroupBox, x15 y165 w515 h250 cBlack, Hotkeys and Macros
Gui, Add, GroupBox, x15 y108 w200 h150 cBlack, 選項
Gui, Add, GroupBox, x+15 w300 h150 cBlack,
Gui, Add, GroupBox, x15 y265 w515 h250 cBlack, 熱鍵與巨集

; Graphical User Interface Checkbox
Gui, Font, Norm
; Gui, Add, Checkbox, x30 y30 vStatus_Blood gLabel_Checkbox Checked%Status_Blood%, Auto Show Health Bars
; Gui, Add, Checkbox, x30 y55 vStatus_Left_AltTab gLabel_Checkbox Checked%Status_Left_AltTab%, Lock Left Alt + Tab
; Gui, Add, Checkbox, x30 y80 vStatus_Right_AltTab gLabel_Checkbox Checked%Status_Right_AltTab%, Lock Right Alt + Tab
; Gui, Add, Checkbox, x30 y105 vStatus_LWin gLabel_Checkbox Checked%Status_LWin%, Lock Left Win Logo Key
; Gui, Add, Checkbox, x30 y130 vStatus_RWin gLabel_Checkbox Checked%Status_RWin%, Lock Right Win Logo Key
Gui, Add, Checkbox, x30 y130 vStatus_Left_AltTab gLabel_Checkbox Checked%Status_Left_AltTab%, 鎖定左 Alt + Tab
Gui, Add, Checkbox, x30 y155 vStatus_Right_AltTab gLabel_Checkbox Checked%Status_Right_AltTab%, 鎖定右 Alt + Tab
Gui, Add, Checkbox, x30 y180 vStatus_LWin gLabel_Checkbox Checked%Status_LWin%, 鎖定左視窗鍵
Gui, Add, Checkbox, x30 y205 vStatus_RWin gLabel_Checkbox Checked%Status_RWin%, 鎖定右視窗鍵
Gui, Add, Checkbox, x30 y230 vStatus_Blood gLabel_Checkbox Checked%Status_Blood%, 隨時顯示生命值計量條

; Graphical User Interface Button
; Gui, Add, Button, x245 y30 w128 h52 gLabel_Readme, &Readme
; Gui, Add, Button, x+15 w127 h52 gLabel_About, &About
; Gui, Add, Button, x245 y92 w270 h52 gLabel_Toggle, Turn Off  (%Key_Toggle%)
; Gui, Add, Button, x245 y92 w270 h52 gLabel_Toggle, Turn On  (%Key_Toggle%)
; Guicontrol, Hide, Turn Off  (%Key_Toggle%)
; Gui, Add, Button, x30 y350 w235 h52 gLabel_Edit, &Edit
; Gui, Add, Button, x280 y350 w235 h52 gLabel_Clear, &Delete
Gui, Add, Button, x245 y130 w128 h52 gLabel_Readme, 說明
Gui, Add, Button, x+15 w127 h52 gLabel_About, 關於作者
Gui, Add, Button, x245 y192 w270 h52 gLabel_Toggle, 暫停 (%Key_Toggle%)
Gui, Add, Button, x245 y192 w270 h52 gLabel_Toggle, 啟動 (%Key_Toggle%)
Guicontrol, Hide, 暫停 (%Key_Toggle%)
Gui, Add, Button, x30 y450 w235 h52 gLabel_Edit, 編輯
Gui, Add, Button, x280 y450 w235 h52 gLabel_Clear, 刪除

; Graphical User Interface Table
Gui, Font, s10
; Gui, Add, ListView, x30 y190 w485 h148 Grid NoSort NoSortHdr -multi gLabel_LVEvent, No.|Hotkeys|Remapping Keys or Macros|Descriptions
Gui, Add, ListView, x30 y290 w485 h148 Grid NoSort NoSortHdr -multi gLabel_LVEvent, 編號|熱鍵|對應按鍵、巨集或文本|註解

; Graphical User Interface Show, Submit and Subroutine
Gui, Show, w545, War3Customkey %Version%
Gui, Submit, NoHide

; 修改滑鼠手勢
    ; Retrieve unique ID number (HWND/handle)
  Gui +LastFound
  WinGet, hw_gui, ID

  ; Call "HandleMessage" when script receives WM_SETCURSOR message
  WM_SETCURSOR = 0x20
  OnMessage(WM_SETCURSOR, "HandleMessage")

  ; Call "HandleMessage" when script receives WM_MOUSEMOVE message
  WM_MOUSEMOVE = 0x200
  OnMessage(WM_MOUSEMOVE, "HandleMessage")

; ListView
Loop, 37
{
Number_No := A_Index
LV_Add("", Number_No, Key_%A_Index%, KeyAction_%A_Index%, KeyDescription_%A_Index%)
; LV_ModifyCol(1, 37)
LV_ModifyCol(1, 50)
LV_ModifyCol(2, 100)
LV_ModifyCol(3, 200)
LV_ModifyCol(4, 110)
}

; --------------------------------------------------------------------------------
; Suspend Toggle
; --------------------------------------------------------------------------------
Hotkey, %Key_Toggle%, Label_Toggle, On
Return
; 啟始載入的資料到此結束

Label_Toggle:
  If Status_Working = 0
  {
    Status_Working = 1
    SetScrollLockState, On
;    Menu, Tray, Check, Turn On  (%Key_Toggle%)
;    Guicontrol, Hide, Turn On  (%Key_Toggle%)
;    Guicontrol, Show, Turn Off  (%Key_Toggle%)
    Menu, Tray, Check, 啟動 (%Key_Toggle%)
    Guicontrol, Hide, 啟動 (%Key_Toggle%)
    Guicontrol, Show, 暫停 (%Key_Toggle%)
    IfWinActive, Warcraft III
    {
      SoundPlay, PeonReady1.wav
      If Status_Blood = 1
      {
        Send, {[ Down}{] Down}
      }
    }

; For Key Mapping (Switch On)
    Loop, 37
    {
      String_Key_Hotkey := Key_%A_Index%
      If String_Key_Hotkey !=
      {
        StringReplace, Key_Pure_%A_Index%, String_Key_Hotkey, {,,A
        StringReplace, Key_Pure_%A_Index%, Key_Pure_%A_Index%, },,A
        String_Key_Hotkey_Pure := Key_Pure_%A_Index%
        Hotkey, IfWinActive, Warcraft III
        Hotkey, %String_Key_Hotkey_Pure%, Label_Key_%A_Index%, On
      }
    }
    Function_Checkbox_Hotkey()
    Return
  }
  Else If Status_Working = 1
  {
    Status_Working = 0
    SetScrollLockState, Off
;    Menu, Tray, Uncheck, Turn On  (%Key_Toggle%)
;    Guicontrol, Hide, Turn Off  (%Key_Toggle%)
;    Guicontrol, Show, Turn On  (%Key_Toggle%)
    Menu, Tray, Uncheck, 啟動 (%Key_Toggle%)
    Guicontrol, Hide, 暫停 (%Key_Toggle%)
    Guicontrol, Show, 啟動 (%Key_Toggle%)
;    Send, {[ Up}{] Up}

; For Key Mapping (Switch Off)
    Loop, 37
    {
      String_Key_Hotkey := Key_%A_Index%
      If String_Key_Hotkey !=
      {
        StringReplace, Key_Pure_%A_Index%, String_Key_Hotkey, {,,A
        StringReplace, Key_Pure_%A_Index%, Key_Pure_%A_Index%, },,A
        String_Key_Hotkey_Pure := Key_Pure_%A_Index%
        Hotkey, IfWinActive, Warcraft III
        Hotkey, %String_Key_Hotkey_Pure%, Label_Key_%A_Index%, Off
      }
    }
    Function_Checkbox_Hotkey()
  }
Return

; --------------------------------------------------------------------------------
; Functions for GUI
; --------------------------------------------------------------------------------
GuiSize:
  If ErrorLevel = 1   ; ErrorLevel = 1 代表 GUI 視窗最小化
  {
    GoSub, Label_Tray_Show_Hide_Main_GUI
  }
Return

GuiClose:
GuiEscape:
  Gosub, Label_Tray_Close
Return

LabelAboutOK:
2GuiClose:
2GuiEscape:
  ;Gui, 1:-Disabled
  Gui, 2:Destroy
  status_about_box := 0
Return

; --------------------------------------------------------------------------------
; Label
; --------------------------------------------------------------------------------
Label_Tray_Show_Hide_Main_GUI:
  If Status_GUI = 0
  {
    Gui, Show
    Status_GUI = 1
    Function_Tray_Show_Hide_Main_GUI()
;    Menu, Tray, Add, &Hide Control Panel, Label_Tray_Show_Hide_Main_GUI
    Menu, Tray, Add, 隱藏控制視窗, Label_Tray_Show_Hide_Main_GUI
;    Menu, Tray, Add, E&xit, Label_Tray_Close
    Menu, Tray, Add, 結束, Label_Tray_Close
;    Menu, Tray, Default, &Hide Control Panel
    Menu, Tray, Default, 隱藏控制視窗
    Return
  }
  Else If Status_GUI = 1
  {
    Gui, Hide
    Status_GUI = 0
    Function_Tray_Show_Hide_Main_GUI()
;    Menu, Tray, Add, &Show Control Panel, Label_Tray_Show_Hide_Main_GUI
;    Menu, Tray, Add, E&xit, Label_Tray_Close
;    Menu, Tray, Default, &Show Control Panel
    Menu, Tray, Add, 顯示控制視窗, Label_Tray_Show_Hide_Main_GUI
    Menu, Tray, Add, 結束, Label_Tray_Close
    Menu, Tray, Default, 顯示控制視窗
  }
Return


Label_Tray_Close:
  SetScrollLockState, Off
  Gui, Destroy   ; 加速 GUI 關閉速度
  ExitApp
Return

Label_Checkbox:
  Gui, Submit, NoHide
  Function_Checkbox()
  Function_Checkbox_Hotkey()
Return

Label_Readme:
  Run War3CustomkeyReadme.txt
Return

Label_About:
  Function_About()
Return

Label_Webpage:
  Run http://changyuheng.github.io/
Return

Label_LVEvent:
Return

Label_Edit:
  Number_LV_Row := LV_GetNext(0, "F")
  If Number_LV_Row = 0
  {
    Return
  }
  Else If Key_%Number_LV_Row% !=
  {
    Gui +OwnDialogs
;    MsgBox, 4,, Are you sure to overwrite the existed setting?
    MsgBox, 4,, 這個動作會覆寫既有的設定，確定要繼續嗎？
    IfMsgBox, No
    {
      return
    }
    IfMsgBox, Yes
    {
      Function_Edit()
    }
    Return
  }
  Else
  {
    Function_Edit()
    Return
  }
Return

Label_Clear:
  Number_LV_Row := LV_GetNext(0, "F")
  If Number_LV_Row = 0
  {
    Return
  }
  Else
  {
    Gui +OwnDialogs
;    MsgBox, 4,, Delete this row?
    MsgBox, 4,, 刪除這一列的設定？
    IfMsgBox, No
    {
      return
    }
    Number_LV_Row := LV_GetNext(0, "F")
    Key_%Number_LV_Row% :=
    KeyAction_%Number_LV_Row% :=
    KeyDescription_%Number_LV_Row% :=
    IniWrite, %String_Blank%, War3Customkey.ini, KeyMapping, Key_%Number_LV_Row%
    IniWrite, %String_Blank%, War3Customkey.ini, KeyMapping, KeyAction_%Number_LV_Row%
    IniWrite, %String_Blank%, War3Customkey.ini, KeyMapping, KeyDescription_%Number_LV_Row%
    Reload
    Return
  }
Return



; --------------------------------------------------------------------------------
; Function
; --------------------------------------------------------------------------------

Function_Checkbox()
{
  Global   ; Function() 內的變數，預設是獨立的（與這個 Function() 外的其他變數無關），加上 Global 才能與整個程式內的變數相通。
  IniWrite, %Status_Blood%, War3Customkey.ini, Configure, Status_Blood
  IniWrite, %Status_Left_AltTab%, War3Customkey.ini, Configure, Status_Left_AltTab
  IniWrite, %Status_Right_AltTab%, War3Customkey.ini, Configure, Status_Right_AltTab
  IniWrite, %Status_LWin%, War3Customkey.ini, Configure, Status_LWin
  IniWrite, %Status_RWin%, War3Customkey.ini, Configure, Status_RWin
  Return
}

Function_Checkbox_Hotkey()
{
  Global
  If Status_Working = 1
  {
    If Status_Left_AltTab = 0
    {
      Hotkey, LAlt & Tab, Label_Key_LAltTab, Off
    }
    If Status_Left_AltTab = 1
    {
      Hotkey, IfWinActive, Warcraft III
      Hotkey, LAlt & Tab, Label_Key_LAltTab, On
    }
    If Status_Right_AltTab = 0
    {
      Hotkey, RAlt & Tab, Label_Key_RAltTab, Off
    }
    If Status_Right_AltTab = 1
    {
      Hotkey, IfWinActive, Warcraft III
      Hotkey, RAlt & Tab, Label_Key_RAltTab, On
    }

  }
  If Status_Working = 0
  {
    Hotkey, LAlt & Tab, Label_Key_LAltTab, Off
    Hotkey, RAlt & Tab, Label_Key_RAltTab, Off

  }
  Return
}

Function_About()
{
  Global

  if status_about_box != 1
  {
  status_about_box := 1
  Gui, 2:+owner
;  Gui +Disabled
  Gui, 2: Font, Bold, Georgia
  Gui, 2: Add, Text, x20 y10, War3Customkey
  Gui, 2: Font, Norm, Georgia
  Gui, 2: Add, Text, x20 y+7, 版本: %Version%
  Gui, 2: Add, Text, X20 y+7, 發表日期: %VersionDate%
  Gui, 2: Add, Text, x20 y+7, 作者: %Author%
  Gui, 2: Add, Text, x20 y+7, 網站:
  Gui, 2: Font, Underline
  Gui, 2: Add, Text, x+3 cBlue gLabel_Webpage vURL_Webpage, A Programmer's Blog
  Gui, 2: Font, Norm, Georgia
  Gui, 2: Add, Button, X230 Y80 W80 H37 gLabelAboutOK, OK
  Gui, 2: Show,, About War3Customkey
  }
  else
  {
    Gui, 2: Show
  }

  ; Retrieve unique ID number (HWND/handle)
  Gui +LastFound
  WinGet, hw_gui, ID

  ; Call "HandleMessage" when script receives WM_SETCURSOR message
  WM_SETCURSOR = 0x20
  OnMessage(WM_SETCURSOR, "HandleMessage")

  ; Call "HandleMessage" when script receives WM_MOUSEMOVE message
  WM_MOUSEMOVE = 0x200
  OnMessage(WM_MOUSEMOVE, "HandleMessage")
  Return
}

Function_Tray_Show_Hide_Main_GUI()
{
  Global
  Menu, Tray, DeleteAll
;  Menu, Tray, Add, Turn On  (%Key_Toggle%), Label_Toggle
  Menu, Tray, Add, 啟動 (%Key_Toggle%), Label_Toggle
  If Status_Working = 0
  {
;    Menu, Tray, Uncheck, Turn On  (%Key_Toggle%)
    Menu, Tray, Uncheck, 啟動 (%Key_Toggle%)
  }
  Else If Status_Working = 1
  {
;    Menu, Tray, Check, Turn On  (%Key_Toggle%)
    Menu, Tray, Check, 啟動 (%Key_Toggle%)
  }
  Return
}

Function_Edit()
{
  Global
  Number_LV_Row := LV_GetNext(0, "F")
  Gui +OwnDialogs
;  InputBox, Key_%Number_LV_Row%, Input Hotkey, Please input hotkey below.
  InputBox, Key_%Number_LV_Row%, 請輸入熱鍵, 請輸入您欲使用的熱鍵。
; If the user presses the CANCEL button: ErrorLevel is set to 1 (or 0 for OK) and OutputVar to the value entered.
  If ErrorLevel = 1
  {
    Reload
    Return
  }
;  InputBox, KeyAction_%Number_LV_Row%, Input Remapping Key or Macro, Please input remapping key or macro below.
  InputBox, KeyAction_%Number_LV_Row%, 請輸入對應按鍵、巨集或文本, 請輸入您想要對應的按鍵、巨集或文本。
  If ErrorLevel = 1
  {
    Reload
    Return
  }
;  InputBox, KeyDescription_%Number_LV_Row%, Write Description, Here you can write label or description for macro.
  InputBox, KeyDescription_%Number_LV_Row%, 請輸入註解, 請輸入本行熱鍵或巨集的註解，若為文本，請輸入 "Text"。
  If ErrorLevel = 1
  {
    Reload
    Return
  }
  Key_Number_LV_Row := Key_%Number_LV_Row%
  IniWrite, %Key_Number_LV_Row%, War3Customkey.ini, KeyMapping, Key_%Number_LV_Row%
  KeyAction_Number_LV_Row := KeyAction_%Number_LV_Row%
  IniWrite, %KeyAction_Number_LV_Row%, War3Customkey.ini, KeyMapping, KeyAction_%Number_LV_Row%
  KeyDescription_Number_LV_Row := KeyDescription_%Number_LV_Row%
  IniWrite, %KeyDescription_Number_LV_Row%, War3Customkey.ini, KeyMapping, KeyDescription_%Number_LV_Row%
  Reload
  Return
}

Function_Send()
{
  Global
  KeyAction_Number := KeyAction_%Number_KeyLabel%
  If KeyDescription_%Number_KeyLabel% contains Text
  {
    ClipSaved := ClipboardAll   ; Save the entire clipboard to a variable of your choice.

; ... here make temporary use of the clipboard, such as for pasting Unicode text via Transform Unicode ...
    Clipboard := KeyAction_Number
    Transform, KeyAction_Number, Unicode
    Clipboard := KeyAction_Number
    SendInput, {Enter}^V{Enter}
    Sleep, 100

    Clipboard := ClipSaved   ; Restore the original clipboard. Note the use of Clipboard (not ClipboardAll).
    ClipSaved =   ; Free the memory in case the clipboard was very large.
    Return
  }
  Else
  {
    SendInput, %KeyAction_Number%
    Return
  }
  Return
}

;Function_FadeIn(GUI_TRANS, WinName)
;{
;   transL := 0
;   Loop, 20
;   {
;      transL += GUI_TRANS//20
;      WinSet, Transparent, %transL%, %WinName%
;      Sleep, 10
;   }
;}

;Function_FadeOut(GUI_TRANS, WinName)
;{
;   transL := GUI_TRANS
;   Loop, 20
;   {
;      transL -= GUI_TRANS//20
;      WinSet, Transparent, %transL%, %WinName%
;      Sleep, 10
;   }
;}

; --------------------------------------------------------------------------------
; Label_Key_*
; --------------------------------------------------------------------------------
Label_Key_1:
  Number_KeyLabel := 1
  Function_Send()
Return

Label_Key_2:
  Number_KeyLabel := 2
  Function_Send()
Return

Label_Key_3:
  Number_KeyLabel := 3
  Function_Send()
Return

Label_Key_4:
  Number_KeyLabel := 4
  Function_Send()
Return

Label_Key_5:
  Number_KeyLabel := 5
  Function_Send()
Return

Label_Key_6:
  Number_KeyLabel := 6
  Function_Send()
Return

Label_Key_7:
  Number_KeyLabel := 7
  Function_Send()
Return

Label_Key_8:
  Number_KeyLabel := 8
  Function_Send()
Return

Label_Key_9:
  Number_KeyLabel := 9
  Function_Send()
Return

Label_Key_10:
  Number_KeyLabel := 10
  Function_Send()
Return

Label_Key_11:
  Number_KeyLabel := 11
  Function_Send()
Return

Label_Key_12:
  Number_KeyLabel := 12
  Function_Send()
Return

Label_Key_13:
  Number_KeyLabel := 13
  Function_Send()
Return

Label_Key_14:
  Number_KeyLabel := 14
  Function_Send()
Return

Label_Key_15:
  Number_KeyLabel := 15
  Function_Send()
Return

Label_Key_16:
  Number_KeyLabel := 16
  Function_Send()
Return

Label_Key_17:
  Number_KeyLabel := 17
  Function_Send()
Return

Label_Key_18:
  Number_KeyLabel := 18
  Function_Send()
Return

Label_Key_19:
  Number_KeyLabel := 19
  Function_Send()
Return

Label_Key_20:
  Number_KeyLabel := 20
  Function_Send()
Return

Label_Key_21:
  Number_KeyLabel := 21
  Function_Send()
Return

Label_Key_22:
  Number_KeyLabel := 22
  Function_Send()
Return

Label_Key_23:
  Number_KeyLabel := 23
  Function_Send()
Return

Label_Key_24:
  Number_KeyLabel := 24
  Function_Send()
Return

Label_Key_25:
  Number_KeyLabel := 25
  Function_Send()
Return

Label_Key_26:
  Number_KeyLabel := 26
  Function_Send()
Return

Label_Key_27:
  Number_KeyLabel := 27
  Function_Send()
Return

Label_Key_28:
  Number_KeyLabel := 28
  Function_Send()
Return

Label_Key_29:
  Number_KeyLabel := 29
  Function_Send()
Return

Label_Key_30:
  Number_KeyLabel := 30
  Function_Send()
Return

Label_Key_31:
  Number_KeyLabel := 31
  Function_Send()
Return

Label_Key_32:
  Number_KeyLabel := 32
  Function_Send()
Return

Label_Key_33:
  Number_KeyLabel := 33
  Function_Send()
Return

Label_Key_34:
  Number_KeyLabel := 34
  Function_Send()
Return

Label_Key_35:
  Number_KeyLabel := 35
  Function_Send()
Return

Label_Key_36:
  Number_KeyLabel := 36
  Function_Send()
Return

Label_Key_37:
  Number_KeyLabel := 37
  Function_Send()
Return

Label_Key_LAltTab:
Return

Label_Key_RAltTab:
Return

; --------------------------------------------------------------------------------
; Special Key Remapping
; --------------------------------------------------------------------------------
LWin::
  If Status_LWin = 0
  {
    Send, {LWin}
    KeyWait, LWin
    Return
  }
  If Status_LWin =
  {
    Send, {LWin}
    KeyWait, LWin
    Return
  }
  Else
  {
    Loop, 37
    {
      String_Key_Hotkey := Key_%A_Index%
      If String_Key_Hotkey !=
      If Status_Working = 1
      {
        StringReplace, Key_Pure_%A_Index%, String_Key_Hotkey, {,,A
        StringReplace, Key_Pure_%A_Index%, Key_Pure_%A_Index%, },,A
        String_Key_Hotkey_Pure := Key_Pure_%A_Index%
        If String_Key_Hotkey_Pure = LWin
        {
          Gosub, Label_Key_%A_Index%
        }
      }
    }
  }
Return

RWin::
  If Status_RWin = 0
  {
    Send, {RWin}
    KeyWait, RWin
    Return
  }
  If Status_RWin =
  {
    Send, {RWin}
    KeyWait, RWin
    Return
  }
  Else
  {
    Loop, 37
    {
      String_Key_Hotkey := Key_%A_Index%
      If String_Key_Hotkey !=
      If Status_Working = 1
      {
        StringReplace, Key_Pure_%A_Index%, String_Key_Hotkey, {,,A
        StringReplace, Key_Pure_%A_Index%, Key_Pure_%A_Index%, },,A
        String_Key_Hotkey_Pure := Key_Pure_%A_Index%
        If String_Key_Hotkey_Pure = RWin
        {
          Gosub, Label_Key_%A_Index%
        }
      }
    }
  }
Return

; --------------------------------------------------------------------------------
; URL Function
; --------------------------------------------------------------------------------
HandleMessage(p_w, p_l, p_m, p_hw)
{
  global WM_SETCURSOR, WM_MOUSEMOVE,
  static URL_hover, h_cursor_hand, h_old_cursor, CtrlIsURL, LastCtrl
  If (p_m = WM_SETCURSOR)
  {
    If URL_hover
      Return, true
  }
  Else If (p_m = WM_MOUSEMOVE)
  {
    ; Mouse cursor hovers URL text control
    StringLeft, CtrlIsURL, A_GuiControl, 3
    If (CtrlIsURL = "URL")
      {
        If URL_hover=
        {
          h_cursor_hand := DllCall("LoadCursor", "uint", 0, "uint", 32649)
          URL_hover := true
        }
        h_old_cursor := DllCall("SetCursor", "uint", h_cursor_hand)
      }
    ; Mouse cursor doesn't hover URL text control
    Else
    {
      If URL_hover
      {
        DllCall("SetCursor", "uint", h_old_cursor)
        URL_hover=
      }
    }
  }
}

PathGetPath(pSourceCmd)
{
   Local Path, ArgsStartPos = 0

   If (SubStr(pSourceCmd, 1, 1) = """")
      Path := SubStr(pSourceCmd, 2, InStr(pSourceCmd, """", False, 2) - 2)
   Else
   {
      ArgsStartPos := InStr(pSourceCmd, " ")
      If ArgsStartPos
        Path := SubStr(pSourceCmd, 1, ArgsStartPos - 1)
      Else
        Path = %pSourceCmd%
   }
   Return Path
}


; --------------------------------------------------------------------------------
; Temp
; --------------------------------------------------------------------------------
^F11::
  var_continuously := 1
  Loop
  {
    if var_continuously = 0
      break
    click
    sleep 20
  }
Return

^F12::
  var_continuously := 0
Return
