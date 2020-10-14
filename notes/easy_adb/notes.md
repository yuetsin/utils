# easy_adb

尝试着当作鼠标、键盘流量、ADB 安装 apk 流量解码了一遍。

然后发现了这货：

```
BTN_TOOL_FINGER       BTN_TOUCH             01c7                 
    ABS (0003): ABS_X                9 : value 0, min 0, max 1439, fuzz 0, flat 0, resolution 0
                ABS_Y                9 : value 0, min 0, max 2959, fuzz 0, flat 0, resolution 0
                ABS_PRESSURE         7 : value 0, min 0, max 63, fuzz 0, flat 0, resolution 0
                ABS_MT_SLOT          6 : value 0, min 0, max 9, fuzz 0, flat 0, resolution 0
                ABS_MT_TOUCH_MAJOR   8 : value 0, min 0, max 255, fuzz 0, flat 0, resolution 0
```

标准的触摸协议协商头。声明了一个 $1439 \times 2959$ 的触摸屏幕。

然后对照着 Linux 源代码翻译一下，用 PIL 画出来，就好了。

