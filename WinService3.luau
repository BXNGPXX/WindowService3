if not game:IsLoaded() then game.Loaded:Wait() end
shared.WinSer3 = {}
local __ = shared.WinSer3
__.starter = false
__.mainframe = nil
__.version = ".0.0.1"
__.delay = .1285

do 
    __.space = {
        --- need a modules sumthing
    }
    for _, v_ in next, ( script.Parent:FindFirstChild( "Packages" ) ):GetChildren() do
        __.space[ v_.Name ] = v_
    end
    __.import = function ( ... )
        local env = getfenv( 0 )
        for _, _z in next, { ... } do
            env[ _z ] = require( __.space[ _z ] )
        end
    end
end

return ""