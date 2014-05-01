前言：
撰寫本程式的目的，是為了彌補魔獸爭霸三沒有為物品欄設計可變換熱鍵的缺憾。

啟動／暫停：
啟動或暫停本程式的方法有以下三種：
1. 使用滑鼠點擊控制視窗內的「啟動／暫停」按鈕。
2. 在常駐列圖示上按右鍵選擇。
3. 使用自定的啟動／暫停熱鍵（預設為 Scroll Lock）。
程式啟動後，Scroll Lock 燈號將亮起。

編輯熱鍵、巨集或文本：
1. 打開控制視窗，選擇您要存放熱鍵、巨集或文本的列號。
2. 點擊「編輯」按鈕。
3. 依序輸入熱鍵、對應鍵、註解。
P.S. 若資料為文本，必須在註解欄輸入 "Text" 方能發送。

熱鍵規則：
1. 單一字母可直接輸入。
   例：a 或 A、1。
2. 非字母之控制按鍵需用大括號包括。
   例：{Space}、{Backspace}、{CapsLock}、{Ctrl}、{F1}。
   P.S. 不建議單獨對 "Ctrl"、"Alt"、"Shift" 三個按鍵做定義。
3. 組合式按鍵：
   如欲指定 Alt+1 之功能，不可直接輸入 {Alt}1，
   需使用組合按鍵之特定代表符號。
   # 代表視窗鍵、^ 代表 Ctrl、! 代表 Alt、+ 代表 Shift。
   例：Alt + 1：!1
       Alt + F1：!{F1}
4. 設定按鍵彈起時作用：
   細心的您可能有注意到，在魔獸爭霸三中，不論是用鍵盤或滑鼠，
   所點擊的功能都是在該按鍵彈起時才起作用。
   本程式可做到相同的效果。只要在熱鍵後方加上 "up" 即可達到這種功效。
   例：a up、{F1 up}。
5. 按鍵表：
   LButton：滑鼠左鍵。
   RButton：滑鼠右鍵。
   MButton：滑鼠中鍵。
   WheelDown：滾輪向下捲動。
   WheelUp：滾輪向上捲動。
   XButton1：滑鼠第四鍵（除了左、右、中鍵外的第一個按鍵）。
   XButton2：滑鼠第五鍵。

   Space：空白鍵。
   Tab
   Enter
   Escape：ESC
   Backspace
   Delete
   Insert
   Home
   End
   PgUp
   PgDn
   Up：方向鍵↑。
   Down
   Left
   Right

   ScrollLock
   CapsLock
   NumLock

   Numpad0：數字鍵盤上的 0。
   NumpadIns：數字鍵盤上的 Insert。
   NumpadEnd
   NumpadDown
   NumpadPgDn
   NumpadLeft
   NumpadClear
   NumpadRight
   NumpadHome
   NumpadUp
   NumpadPgUp
   NumpadDot：數字鍵盤的 .。
   NumpadDel
   NumpadDiv：數字鍵盤的斜線 (Slash /)。
P.S. 很多人不會分辨 / 和 \ 的差別。前者叫斜線 (Slash)，後者叫稱反斜線 (Backslash)。
   NumpadMult：數字鍵盤的萬用字元 (*)。
   NumpadAdd：(+)。
   NumpadSub：(-) 。
   NumpadEnter

   鍵盤上同時有兩個一樣功能的按鍵：
   像 Ctrl、Alt、Shift、Windows Logo。
   LCtrl：左邊的 Ctrl。
   RCtrl：右邊的 Ctrl。
   LAlt
   RAlt
   LShift
   RShift
   LWin
   Rwin

6. War3Customkey.ini 為本程式運行所需，請和主程式放在相同資料夾。

7. 若程式啟動時發生錯誤，可能是因為腳本不正確，請將 War3Customkey.ini 移除，
   再次執行後，本程式將會自動產生一份新的 War3Customkey.ini。

8. 自訂「啟動／暫停」熱鍵：
   a. 用記事本開啟 War3Customkey.ini
   b. 找到 Key_Toggle=ScrollLock 這一行
   c. 把 ScrollLock 是預設的熱鍵。把 ScrollLock 改成欲使用之按鍵即可。



1. This program only works when ScrolLock is on.
2. "War3Customkey.ini" must be in the same directory with "War3Customkey.exe".
3. If it prompts any errors while launching, just delete "War3Customkey.ini".

How to set up a macro?

Please read
http://www.autohotkey.com/docs/Hotkeys.htm#Symbols
or
http://dotakeys.3.forumer.com/index.php?showtopic=336
