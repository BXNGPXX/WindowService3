Get Start Module
```luau
require ( "WinService3" )
local __ = shared.WinSer3
__.import( "_InitWin3", "_componButton" )
```
import list
- `_InitWin3` WindowService
- `_componButton` ButtonEvents

New Window
```luau
require ( "WinService3" )
local __ = shared.WinSer3
__.import( "_InitWin3" )

local Window = _InitWin3.Window( WindowFrame, {
        Position = UDim2.new( .5, -1 ),
        GroupTransparency = 1
    }, 
    TweenInfo.new( .2 ), "WindowName" 
)
```
_InitWin3.Window Function
- `Window.Open ()`
- `Window.Close ()`