local Bracket = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexR32/Bracket/main/BracketV33.lua"))()
Bracket:Notification({Title = "Ruined",Description = "GUI loaded",Duration = 5}) -- Duration can be nil for "x" to pop up
Bracket:Notification2({Title = "Ruined by @yellowguy24 on Discord",Duration = 5})

local CoreGui = game:GetService("CoreGui")
local TeleportService = game:GetService("TeleportService")

local function DestroyBracketUI()
    for _, gui in ipairs(CoreGui:GetChildren()) do
        if gui:IsA("ScreenGui") and gui.Name:match("^Bracket ") then
            gui:Destroy()
            break
        end
    end
end

-- see source code for more hidden things i forgot to add in this example
local Window = Bracket:Window({Name = "Window",Enabled = true,Color = Color3.new(1,0.5,0.25),Size = UDim2.new(0,496,0,496),Position = UDim2.new(0.5,-248,0.5,-248)}) do
    Window.Name = "Ruined v0.1"
    --Window.Size = UDim2.new(0,496,0,496)
    --Window.Position = UDim2.new(0.5,-248,0.5,-248)
    --Window.Color = Color3.new(1,0.5,0.25)
    --Window.Enabled = true
    --Window.Blur = true

    local Tab = Window:Tab({Name = "Info",Side = "Left"}) do

        local Section = Tab:Section({Name = "Credits",Side = "Right"}) do

            Section:Label({Text = "GitHub - AlexR32 - UI library"})

            Section:Label({Text = "Discord - yellowguy24 - GUI"})
        end

        local Section = Tab:Section({Name = "Welcome",Side = "Left"}) do

            Section:Label({Text = "Welcome to the Ruined GUI. This is a simple and mostly client-sided exploit GUI that can be used for most Roblox games. Thank you for executing."})
            Section:Label({Text = "It's mostly just customization for now. That is because I haven't started reverse engineering a game yet."})


            Tab:Label({Text = "You can probably just use inf yield for more than half of this shit",Side = "Left"})
            Tab:Label({Text = "Don't even think of saying I used ai for this",Side = "Left"})
        end
    end

    local Tab = Window:Tab({Name = "Main",Side = "Left"}) do

        local Section = Tab:Section({Name = "Scripts",Side = "Left"}) do

            Section:Label({Text = "Scripts that are mostly universal and can be used in most if not all games"})

            Section:Button({Name = "Infinite Yield",Callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() end})
            
            Section:Button({Name = "Novoline",Callback = function()
                loadstring(game:HttpGet("https://novoline.pro"))() end})
            
            Section:Button({Name = "Dex++",Callback = function()
                loadstring(game:HttpGet("https://github.com/AZYsGithub/DexPlusPlus/releases/latest/download/out.lua"))() end})
        end

        local Section = Tab:Section({Name = "Lighting",Side = "Right"}) do

            Section:Divider({Text = "Appearance"})
            
            Section:Toggle({Name = "GlobalShadows",Value = true,Callback = function(bool)
                game.Lighting.GlobalShadows = (bool) end})

            Section:Dropdown({Name = "LightingStyle",List = {
                {
                    Name = "Soft",
                    Mode = "Button",
                    Value = false,
                    Callback = function()
                        game.Lighting.LightingStyle = Enum.LightingStyle.Soft
                    end
                },
                {
                    Name = "Realistic",
                    Mode = "Button",
                    Value = false,
                    Callback = function()
                        game.Lighting.LightingStyle = Enum.LightingStyle.Realistic
                    end
                }
            }})

            Section:Slider({Name = "Brightness",Min = 0,Max = 10,Value = 2,Callback = function(Value)
                game.Lighting.Brightness = (Value) end})

            Section:Divider({Text = "Data"})

            Section:Slider({Name = "ClockTime",Min = 0,Max = 24,Value = 12,Precise = 1,Callback = function(value)
                game.Lighting.ClockTime = (value) end})

            Section:Toggle({Name = "Time Accelerator",Value = false,Callback = function(bool)
                New = bool

                if bool then
                    task.spawn(function()
                        while New do
                            game.Lighting.ClockTime += 0.05
                            task.wait()
                        end
                    end)
                end
            end}):ToolTip("Runs at your framerate")

            Section:Slider({Name = "GeographicLatitude",Min = 0,Max = 100,Value = 0,Callback = function(value)
                game.Lighting.GeographicLatitude = (value) end})
            
            Section:Divider({Text = "Fog"})

            Section:Label({Text = "Fog does not work with all games."})

            Section:Colorpicker({Name = "FogColor",Flag = "Colorpicker",Value = {1,1,1,0,false},Callback = function(HSVAR_Table,Color3)
                game.Lighting.FogColor = (Color3) end})

            Section:Slider({Name = "FogStart",Flag = "Slider",Min = 0,Max = 1000,Value = 0,Callback = function(Value_Number)
                game.Lighting.FogStart = (Value_Number) end})
            
            Section:Slider({Name = "FogEnd",Flag = "Slider",Min = 0,Max = 1000,Value = 1000,Callback = function(Value_Number)
                game.Lighting.FogEnd = (Value_Number) end})
            
            Section:Button({Name = "Reset to default",Callback = function()
                game.Lighting.FogEnd = 100000
                game.Lighting.FogStart = 0 end})
        end

        local Section = Tab:Section({Name = "Player",Side = "Left"}) do

            Section:Label({Text = "Most player exploits will not work."})

            Section:Label({Text = "It depends on the game."})

            Section:Toggle({Name = "Fake Tab/Lag(R6)",Value = false,Callback = function(Toggle_Bool)
                game.Players.LocalPlayer.Character.Torso.Anchored = (Toggle_Bool) end}):Keybind({Flag = "Toggle/Keybind",Value = "NONE",DoNotClear = false,Mouse = false,Callback = function(Key_String,Pressed_Bool,Toggle_Bool) end,Blacklist = {"W","A","S","D","Slash","Tab","Backspace","Escape","Space","Delete","Unknown","Backquote"}})

            Section:Toggle({Name = "Fake Tab/Lag(R15)",Value = false,Callback = function(Toggle_Bool)
                game.Players.LocalPlayer.Character.UpperTorso.Anchored = (Toggle_Bool) end}):Keybind({Flag = "Toggle/Keybind",Value = "NONE",DoNotClear = false,Mouse = false,Callback = function(Key_String,Pressed_Bool,Toggle_Bool) end,Blacklist = {"W","A","S","D","Slash","Tab","Backspace","Escape","Space","Delete","Unknown","Backquote"}})
            
            Section:Slider({Name = "Health (Client)",Flag = "Slider",Min = 1,Max = 100,Value = 100,Precise = 2,Callback = function(Value_Number)
                game.Players.LocalPlayer.Character.Humanoid.Health = (Value_Number) end})
            
            Section:Button({Name = "Set health to 0",Callback = function()
                game.Players.LocalPlayer.Character.Humanoid.Health = 0 end})

            Section:Slider({Name = "WalkSpeed",Min = 0,Max = 200,Value = 16,Callback = function(value)
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (value) end})

            Section:Slider({Name = "JumpPower",Min = 0,Max = 200,Value = 50,Callback = function(value)
                game.Players.LocalPlayer.Character.Humanoid.JumpPower = (value) end})

            Section:Slider({Name = "HipHeight",Min = 0,Max = 200,Value = 2,Callback = function(value)
                game.Players.LocalPlayer.Character.Humanoid.HipHeight = (value) end})
        end
    end

    local OptionsTab = Window:Tab({Name = "Options"}) do
        local MenuSection = OptionsTab:Section({Name = "Menu",Side = "Left"}) do
            local UIToggle = MenuSection:Toggle({Name = "UI Enabled",Flag = "UI/Enabled",IgnoreFlag = true,
            Value = Window.Enabled,Callback = function(Bool) Window.Enabled = Bool end})
            UIToggle:Keybind({Value = "End",Flag = "UI/Keybind",DoNotClear = true})
            UIToggle:Colorpicker({Flag = "UI/Color",Value = {1,0.25,1,0,true},
            Callback = function(HSVAR,Color) Window.Color = Color end})

            MenuSection:Toggle({Name = "Open On Load",Flag = "UI/OOL",Value = true})
            MenuSection:Toggle({Name = "Blur Gameplay",Flag = "UI/Blur",Value = false,
            Callback = function(Bool) Window.Blur = Bool end})

            MenuSection:Button({Name = "Unload UI",Callback = function()
                DestroyBracketUI() end})
        end

        OptionsTab:AddConfigSection("Ruined","Left")

        local BackgroundSection = OptionsTab:Section({Name = "Background",Side = "Right"}) do
            BackgroundSection:Colorpicker({Name = "Color",Flag = "Background/Color",Value = {1,1,0,0,false},
            Callback = function(HSVAR,Color) Window.Background.ImageColor3 = Color Window.Background.ImageTransparency = HSVAR[4] end})
            BackgroundSection:Textbox({HideName = true,Flag = "Background/CustomImage",Placeholder = "rbxassetid://ImageId",
            Callback = function(String,EnterPressed) if EnterPressed then Window.Background.Image = String end end})
            BackgroundSection:Dropdown({HideName = true,Flag = "Background/Image",List = {
                {Name = "Legacy",Mode = "Button",Callback = function()
                    Window.Background.Image = "rbxassetid://2151741365"
                    Window.Flags["Background/CustomImage"] = ""
                end},
                {Name = "Hearts",Mode = "Button",Callback = function()
                    Window.Background.Image = "rbxassetid://6073763717"
                    Window.Flags["Background/CustomImage"] = ""
                end},
                {Name = "Abstract",Mode = "Button",Callback = function()
                    Window.Background.Image = "rbxassetid://6073743871"
                    Window.Flags["Background/CustomImage"] = ""
                end},
                {Name = "Hexagon",Mode = "Button",Callback = function()
                    Window.Background.Image = "rbxassetid://6073628839"
                    Window.Flags["Background/CustomImage"] = ""
                end},
                {Name = "Circles",Mode = "Button",Callback = function()
                    Window.Background.Image = "rbxassetid://6071579801"
                    Window.Flags["Background/CustomImage"] = ""
                end},
                {Name = "Lace With Flowers",Mode = "Button",Callback = function()
                    Window.Background.Image = "rbxassetid://6071575925"
                    Window.Flags["Background/CustomImage"] = ""
                end},
                {Name = "Floral",Mode = "Button",Callback = function()
                    Window.Background.Image = "rbxassetid://5553946656"
                    Window.Flags["Background/CustomImage"] = ""
                end,Value = true},
                {Name = "Halloween",Mode = "Button",Callback = function()
                    Window.Background.Image = "rbxassetid://11113209821"
                    Window.Flags["Background/CustomImage"] = ""
                end},
                {Name = "Christmas",Mode = "Button",Callback = function()
                    Window.Background.Image = "rbxassetid://11711560928"
                    Window.Flags["Background/CustomImage"] = ""
                end}
            }})
            BackgroundSection:Slider({Name = "Tile Offset",Flag = "Background/Offset",Wide = true,Min = 74,Max = 296,Value = 74,
            Callback = function(Number) Window.Background.TileSize = UDim2.fromOffset(Number,Number) end})
        end
    end
end

Window:SetValue("Background/Offset",74)
Window:AutoLoadConfig("Bracket_Example")
Window:SetValue("UI/Enabled",Window.Flags["UI/OOL"])