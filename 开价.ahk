#Include C:\Users\Administrator\Desktop\hotKey\UIA.ahk ; 引入 UIA 库

Numpad7::
NumpadHome::
F8::
    ; 初始化 UIA 库
    UIA := UIA_Interface()

    ; 获取活动窗口（假设是浏览器）
    WinGet, hWnd, ID, A ; 获取当前活动窗口的句柄
    browserEl := UIA.ElementFromHandle(hWnd) ; 获取浏览器的根元素

    loop, 10   ;最多10次
    {
        ; 查找“预热”按钮
        preheatButton := browserEl.FindFirstBy("Name=开价 AND ControlType=Button")

        if (preheatButton) {
            preheatButton.Click()
            Sleep, 5000
        } else {
            ;MsgBox, 未找到预热按钮！
            break
        }

    }

    preheatButton := browserEl.FindFirstBy("Name=取消讲解 AND ControlType=Button")

    if (preheatButton) {
        preheatButton.Click()
        Sleep, 1300
    }

    preheatButton := browserEl.FindFirstBy("Name=讲解 AND ControlType=Button")

    if (preheatButton) {
        preheatButton.Click()
    }

return