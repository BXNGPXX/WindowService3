# WindowService3 v.0.0.1
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
```luau
require ( "WinService3" )
local __ = shared.WinSer3
__.import( "_InitWin3" )
```
 **Window** `_InitWin3.Window ( _Frame : Frame?, _Goal : any?, Info : TweenInfo?, WindowName : string? )`
```luau
local Window = _InitWin3.Window( WindowFrame, {
        Position = UDim2.new( .5, -1 ),
        GroupTransparency = 1
    }, 
    TweenInfo.new( .2 ), "WindowName" 
)
```

 **Alert Window** `_InitWin3.Window ( _Frame : Frame?, _Goal : any?, Info : TweenInfo?, WindowName : string? | "Alert-name"? )`
```luau
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
_InitWin3.CloseAllWindow ( "IgnoreWindow" )
task.wait( 2 )
_InitWin3.CloseAllWindow ( )
 ```
 **CloseAllAlert** `_InitWin3.CloseAllAlert ( ignoreAlertWindow : string )`
  ```luau
_InitWin3.CloseAllAlert ( "IgnoreAlertWindow" )
task.wait( 2 )
_InitWin3.CloseAllAlert ( )
 ```
 **GetWindow** `_InitWin3.GetWindow ( windowName : string? )`
  ```luau
local window = _InitWin3.GetWindow ( windowName )
 ```
 **GetAlert** `_InitWin3.GetAlert ( alertWindowName : string? )`
  ```luau
local alertWindow = _InitWin3.GetWindow ( alertWindowName )
 ```

 ## _componButton
 ```luau
require ( "WinService3" )
local __ = shared.WinSer3
__.import( "_componButton" )
 ```
 **ScaleTween** `_componButton.ScaleTween ( instance : Instance, percen : number, Info : TweenInfo )`
 ```luau
_componButton.ScaleTween ( Frame, 50, TweenInfo.new( .2 ) )
 ```
  **InitJelly** `_componButton.InitJelly ( instance : Instance, percen : number, Infos : any? )`
 ```luau
-- none info
_componButton.InitJelly ( Frame, 50 ) -- defualt info is TweenInfo.new( .03 )
-- single info
_componButton.InitJelly ( Frame, 50, TweenInfo.new( .2 ) ) -- using TweenInfo.new( .2 )
-- double info ( start, end )
_componButton.InitJelly ( Frame, 50, {
    [ 1 ] = TweenInfo.new( .2 ), -- start, in
    [ 2 ] = TweenInfo.new( .1 ) -- end, out
}) 
 ```

## _navbar
 ```luau
require ( "WinService3" )
local __ = shared.WinSer3
__.import( "_navbar" )
 ```
  **Init** `_navbar.Init ( Template : any?, Configs : any?, Callback : any? )`
 > Fix Pages
```luau
--- navbar
local nav_config = {
    { title = "Home", active = true, ... },
    { title = "Backpack", ... },
    { title = "Setting", ... },
}
local nav_template = {
    NavbarButton = MainFrame2.nav.TextButton,
    NavPages = {
        [ "Home" ] = MainFrame2.Homepage,
        [ "Backpack" ] = MainFrame2.Backpackpage,
        [ "Setting" ] = MainFrame2.Settingpage,
    }
}
_navbar.Init ( nav_template, nav_config )
```
 > Auto Pages ( Using Template )
 ```luau
--- navbar
local nav_config = {
    { title = "Home", active = true, ... },
    { title = "Backpack", ... },
    { title = "Setting", ... },
}
local nav_template = {
    NavbarButton = MainFrame2.nav.TextButton,
    NavPage = MainFrame2.page
}
_navbar.Init ( nav_template, nav_config )
```
 > nav_config
```luau
local nav_config = {
    { title = "Title", active = true, ... },
    { title = "Title 2", ... },
}
```
 > nav_template
 ```luau
local nav_template = {
    NavbarButton = Button : TextButton | ImageButton,
    NavPage = Page : Frame | ScrollingFrame | CanvasGroup
    --- or
    NavPages = {
      [ "Title" ] = Page : Frame | ScrollingFrame | CanvasGroup,
      [ "Title2" ] = Page2 : Frame | ScrollingFrame | CanvasGroup,
    }
}
```
 > nav_callback
```luau
local nav_callback = {
  --- ButtonActive
  ButtonActive = function ( NavbarButton, i, config )
    NavbarButton.TextColor3 = Color3.fromRGB(255, 255, 255)
  end,
  --- ButtonInActive
  ButtonInActive = function ( NavbarButton, i, config )
    NavbarButton.TextColor3 = Color3.fromRGB(100, 100, 100)
  end,
  --- SetupButton
  SetupButton = function ( NavbarButton, i, config )
    NavbarButton.Text = config.title
  end,
  --- SetupPage
  SetupPage = function ( NavPage, i, config )
        NavPage.Name = config.title
  end,
  --- ChangePage
  ChangePage = function ( CurrentPage, CurrentButton, CurrentConfig )
        print( `To Page`, CurrentPage )
  end
}
```