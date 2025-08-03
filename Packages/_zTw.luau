local tween = game:GetService( "TweenService" )

local modules = {}

modules.tw = function ( instance : Instance, Info : TweenInfo?, Properties : any )
    Info = Info or TweenInfo.new( 0 )
    local _objztw_ = tween:Create(instance, Info, Properties)
    if _objztw_ then
        _objztw_:Play()
    end
    return _objztw_ :: Tween
end


return modules