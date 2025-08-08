_G.packages = {
    _zTw = require( "./_zTw" ),
    compoBtn = require( "./_componButton" ),
}

local Windows = {}
local Alerts = {}
local winser3 = {}

winser3.CloseAllWindow = function ( ignoreWindow : string )
    task.defer( function() 
        for _, v in next, Windows do
            if v and v[ "Close" ] and v.Name and v.Name ~= ignoreWindow then
                v.Close()
            end
        end
    end)
end
winser3.CloseAllAlert = function ( ignoreWindow : string )
    task.defer( function() 
        for _, v in next, Alerts do
            if v and v[ "Close" ] and v.Name and v.Name ~= ignoreWindow then
                v.Close()
            end
        end
    end)
end

winser3.GetWindow = function ( windowName : string )
    return Windows[ windowName ] or nil
end
winser3.GetAlert = function ( alertWindowName : string )
    return Alerts[ alertWindowName ] or nil
end

winser3.Window = function ( _Frame : Frame?, _Goal : any?, Info : TweenInfo?, WindowName : string? | "Alert-name"? )

    --- setup variable
    if not _Goal then
        _Goal = { Position = UDim2.fromScale( .5 , -1 ) }
    end
    if not Info then
        Info = TweenInfo.new( .25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut )
    end

    --- setup table
    local _Window = {}
    _Window.Name = WindowName
    _Window.Frame = _Frame
    _Window.Active = false
    _Window.Goal = _Goal
    _Window.Default = {}
    _Window.startCallback = { open = {}, close = {} }
    _Window.endCallback = { open = {}, close = {} }
    
    _Window.Frame.Visible = false
    for i_ , _v in next, _Window.Goal do
        if _Window.Frame[ i_ ] then
            _Window.Default[ i_ ] = _Window.Frame[ i_ ]
            _Window.Frame[ i_ ] = _v
        end
    end

    --- add in table
    if WindowName and typeof( WindowName ) == "string" and WindowName:find( "Alert-" ) then
        if Alerts[ WindowName ] then 
            warn( `have a {WindowName} in AlertTable` )
            return
        else
            Alerts[ WindowName ] = _Window
        end
    else
        if WindowName and typeof( WindowName ) == "string" and Windows[ WindowName ] then
            warn( `have a {WindowName} in WindowTable` )
            return
        else
            Windows[ WindowName ] = _Window
        end
    end

    --- function
    _Window.Close = function ()
        _Window.Active = false

        --- close callback
        task.defer( function () 
            local close_tw = _G.packages._zTw.tw( _Window.Frame, Info, _Window.Goal ) :: Tween
            close_tw:Play()
            
            --- callback
            if next( _Window.startCallback[ "close" ] ) then 
                for _, call in next, _Window.startCallback[ "close" ] do
                    task.defer( function () 
                        if call then call ( ) end
                    end)
                end
            end
            
            close_tw.Completed:Once ( function()  
                _Window.Frame.Visible = false

                if not next( _Window.endCallback[ "close" ] ) then return end
                for _, call in next, _Window.endCallback[ "close" ] do
                    task.defer( function () 
                        if call then call ( ) end
                    end)
                end
            end)
        end)
    end

    _Window.Open = function ()

        if _Window.Active == true then
            _Window.Close()
            return
        end

        if _Window.Name and typeof( _Window.Name ) == "string" and _Window.Name:find( "Alert-" ) then
            winser3.CloseAllAlert( _Window.Name )
            -- print( "Alert" )
        else
            winser3.CloseAllWindow( _Window.Name )
            -- print( "Window" )
        end
        

        _Window.Active = true
        _Window.Frame.Visible = true

        --- open callback
        task.defer( function () 
            local open_tw = _G.packages._zTw.tw( _Window.Frame, Info, _Window.Default ) :: Tween
            open_tw:Play()

            --- callback
            if next( _Window.startCallback[ "open" ] ) then 
                for _, call in next, _Window.startCallback[ "open" ] do
                    task.defer( function () 
                        if call then call ( ) end
                    end)
                end
            end

            open_tw.Completed:Once ( function()  
                if not next( _Window.endCallback[ "open" ] ) then return end
                for _, call in next, _Window.endCallback[ "open" ] do
                    task.defer( function () 
                        if call then call ( ) end
                    end)
                end
            end)
            

        end)

    end

    --- other function
    _Window._StartOpen = function ( callback )
        if callback then
            table.insert( _Window.startCallback[ "open" ], callback )
        end
    end
    _Window._EndOpen = function ( callback )
        if callback then
            table.insert( _Window.endCallback[ "open" ], callback )
        end
    end
    _Window._StartClose = function ( callback )
        if callback then
            table.insert( _Window.startCallback[ "close" ], callback )
        end
    end
    _Window._EndClose = function ( callback )
        if callback then
            table.insert( _Window.endCallback[ "close" ], callback )
        end
    end


    return _Window
end

return winser3