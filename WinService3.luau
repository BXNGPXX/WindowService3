--- service
local tween = game:GetService( "TweenService" )

--- variable
local Window = {}

--- type
export type typeProperties = {
    Position : UDim2?,
    Size : UDim2?,
    BackgroundColor3 : Color3?,
    BackgroundTransparency : number?,
    AnchorPoint : Vector2?,
}
export type typeGoal = {
    Set : typeProperties,
}

local winser3 = {}

winser3.Window = function ( _Frame : Frame, _Goal : typeGoal )
    print( "ASS" )
end

return winser3