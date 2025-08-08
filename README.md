# Get Start Module
```luau
require ( "WinService3" )
local __ = shared.WinSer3
__.import( "_InitWin3", "_componButton" )
```
import list
- `_InitWin3` - WindowService
- `_componButton` - ButtonEvents

# _InitWin3

 **Window** `_InitWin3.Window ( _Frame : Frame?, _Goal : any?, Info : TweenInfo?, WindowName : string? )`
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

 **Alert Window** `_InitWin3.Window ( _Frame : Frame?, _Goal : any?, Info : TweenInfo?, WindowName : string? | "Alert-name"? )`
```luau
require ( "WinService3" )
local __ = shared.WinSer3
__.import( "_InitWin3" )

local AlertWindow = _InitWin3.Window( WindowFrame, {
        Position = UDim2.new( .5, -1 ),
        GroupTransparency = 1
    }, 
    TweenInfo.new( .2 ), "Alert-WindowName"  --- request "Alert-"
)
```
> _InitWin3.Window Function
- `Window.Open ()` - open window
- `Window.Close ()` - close window
- `Window._StartOpen ( callback_function )` - add function on start open animation
- `Window._EndOpen ( callback_function )` - add function on open animation ended
- `Window._StartClose ( callback_function )` - add function on start close animation
- `Window._EndClose ( callback_function )` - add function on close animation ended

 **CloseAllWindow** `_InitWin3.CloseAllWindow ( ignoreWindow : string )`
 ```luau
require ( "WinService3" )
local __ = shared.WinSer3
__.import( "_InitWin3" )

_InitWin3.CloseAllWindow ( "IgnoreWindow" )
task.wait( 2 )
_InitWin3.CloseAllWindow ( )
 ```

 **CloseAllAlert** `_InitWin3.CloseAllAlert ( ignoreAlertWindow : string )`
  ```luau
require ( "WinService3" )
local __ = shared.WinSer3
__.import( "_InitWin3" )

_InitWin3.CloseAllAlert ( "IgnoreAlertWindow" )
task.wait( 2 )
_InitWin3.CloseAllAlert ( )
 ```

 **GetWindow** `_InitWin3.GetWindow ( windowName : string )`
  ```luau
require ( "WinService3" )
local __ = shared.WinSer3
__.import( "_InitWin3" )

local window = _InitWin3.GetWindow ( windowName )
 ```

 **GetAlert** `_InitWin3.GetAlert ( alertWindowName : string )`
  ```luau
require ( "WinService3" )
local __ = shared.WinSer3
__.import( "_InitWin3" )

local alertWindow = _InitWin3.GetWindow ( alertWindowName )
 ```