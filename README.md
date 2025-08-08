## Get Start Module
```luau
require ( "WinService3" )
local __ = shared.WinSer3
__.import( "_InitWin3", "_componButton" )
```
import list
- `_InitWin3` - WindowService
- `_componButton` - ButtonEvents

## _InitWin3
# Window
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
# Alert Window
```luau
require ( "WinService3" )
local __ = shared.WinSer3
__.import( "_InitWin3" )

local AlertWindow = _InitWin3.Window( WindowFrame, {
        Position = UDim2.new( .5, -1 ),
        GroupTransparency = 1
    }, 
    TweenInfo.new( .2 ), "WindowName-Alert"  --- request "-Alert"
)
```
_InitWin3.Window Function
- `Window.Open ()` - open window
- `Window.Close ()` - close window
- `Window._StartOpen ( callback_function )` - add function on start open animation
- `Window._EndOpen ( callback_function )` - add function on open animation ended
- `Window._StartClose ( callback_function )` - add function on start close animation
- `Window._EndClose ( callback_function )` - add function on close animation ended
