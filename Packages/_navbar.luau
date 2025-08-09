local navbar = {}

navbar.Init = function ( Template : any?, Configs : any?, Callback : any? )
    
    local Nav = {}
    Nav.ButtonPath = Template.NavbarButton.Parent
    Nav.ButtonTemplate = Template.NavbarButton
    Nav.ButtonEvents = {
        Active = {},
        Hide = {}
    }
    if Template.NavPage then
        Nav.PagePath = Template.NavPage.Parent
        Nav.PageTemplate = Template.NavPage
    elseif Template.NavPages then
        Nav.PageTemplates = Template.NavPages
    end
    Nav.Page = {}
    
    Nav.CurrentPage = ""

    --- function
    Nav.ChangePage = function ( pageTitle : string )
        for _, v in next, Nav.Page do

            if v.Config.title == pageTitle then

                Nav.CurrentPage = pageTitle

                v.Page.Visible = true
                if Callback and Callback.ChangePage then
                    Callback.ChangePage( v.Page, v.Button, v.Config )
                end
                if Callback and Callback.ButtonActive then
                    Callback.ButtonActive( v.Button, v.i, v.Config )
                end
            else
                v.Page.Visible = false
                if Callback and Callback.ButtonInActive then
                    Callback.ButtonInActive( v.Button, v.i, v.Config )
                end
            end
        end
    end

    --- setup
    Nav.ButtonTemplate.Parent = nil
    if Nav.PageTemplate then
        Nav.PageTemplate.Parent = nil
    end

    if Configs and next( Configs ) then
    
        for i, config in next, Configs do
            
            --- button
            local Button = Nav.ButtonTemplate:Clone() :: TextButton
            if Callback and Callback.SetupButton then
                Callback.SetupButton( Button, i, config )
            else
                if Button:IsA( "TextButton" ) then
                    Button.Text = config.title
                end
            end
            Button.Parent = Nav.ButtonPath
            Button.MouseButton1Click:Connect(function()
                Nav.ChangePage( config.title )
            end)

            --- page
            local Page
            if Nav.PageTemplate then
                Page = Nav.PageTemplate:Clone() :: Instance
                if Callback and Callback.SetupPage then
                    Callback.SetupPage( Page, i, config )
                end
                Page.Parent = Nav.PagePath
            elseif Nav.PageTemplates then
                if Nav.PageTemplates[ config.title ] then
                    Page = Nav.PageTemplates[ config.title ]
                    if Callback and Callback.SetupPage then
                        Callback.SetupPage( Page, i, config )
                    end
                else
                    warn( `No page template found for {config.title}` )
                    continue
                end
            end

            -- active
            if config.active == true then
                Nav.CurrentPage = config.title
                Page.Visible = true
                if Callback and Callback.ButtonActive then
                    Callback.ButtonActive( Button, i, config )
                end

            else
                 Page.Visible = false
                 if Callback and Callback.ButtonInActive then
                    Callback.ButtonInActive( Button, i, config )
                end
            end

            -- end
            Nav.Page[ config.title ] = {
                i = i,
                Button = Button,
                Page = Page,
                Config = config
            }
        end

    end

    return Nav
end

return navbar