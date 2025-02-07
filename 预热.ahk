#Include  .\UIA.ahk ; 引入 UIA 库

Numpad1::
NumpadEnd::
F9::
    ; 初始化 UIA 库
    UIA := UIA_Interface()

    ; 获取活动窗口（假设是浏览器）
    WinGet, hWnd, ID, A ; 获取当前活动窗口的句柄
    browserEl := UIA.ElementFromHandle(hWnd) ; 获取浏览器的根元素

    loop, 1   ;最多10次
    {
        ; 查找“预热”按钮
        preheatButton := browserEl.FindFirstBy("Name=预热 AND ControlType=Button")

        if (preheatButton) {
            preheatButton.Click()
            Sleep, 680
            preheatButton := browserEl.FindFirstBy("Name=直接预热 AND ControlType=Button")
            if (preheatButton) {
                preheatButton.Click()
            } else {
                ;MsgBox, 未找到直接预热按钮！
            }
            Sleep, 6000
        } else {
            ;MsgBox, 未找到预热按钮！
            break
        }

    }

return