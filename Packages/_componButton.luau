local _componButton = {}

_componButton.ScaleTween = function ( instance : Instance, percen : number, Info : TweenInfo )
    if not _G and not _G.packages then return end
    Info = Info or TweenInfo.new( .03 )
    local UIScale = instance and instance:FindFirstChildWhichIsA( "UIScale" )
    if not UIScale then
        UIScale = Instance.new( "UIScale", instance )
    end
    if UIScale then
        local _objtw_ = _G.packages._zTw.tw( UIScale, Info, { Scale = percen/100 } )
        _objtw_:Play()
        return _objtw_
    end
    return nil
end
_componButton.InitJelly = function ( instance : Instance, percen : number, Infos : any? )
    Infos = Infos or TweenInfo.new( .03 )
    if typeof(Infos) == "TweenInfo" then
        local Temp_Infos = {}
        Temp_Infos[ 1 ] = Infos
        Temp_Infos[ 2 ] = Infos
        Infos = Temp_Infos

        _componButton.ScaleTween ( instance, percen, Temp_Infos[ 1 ] ).Completed:Once(function()
            _componButton.ScaleTween ( instance, 100, Temp_Infos[ 2 ] )
        end)
    end
end

return _componButton