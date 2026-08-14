local exec, ver = identifyexecutor()

task.wait()

if exec == nil then
    print("Your executor does not support identifyexecutor() or you are not using an executor")
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Info";
        Text = "Check dev console";
        Duration = 5
    })
    return
else
    print("Яuined, using " .. exec .. " " .. ver)
end

local Bracket = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexR32/Bracket/main/BracketV33.lua"))()

local CoreGui = game:GetService("CoreGui")
local TeleportService = game:GetService("TeleportService")

local Ruined = nil

for _, gui in ipairs(CoreGui:GetChildren()) do
    if gui:IsA("ScreenGui") and gui.Name:match("^Bracket ") then
        Ruined = gui
        break
    end
end

local Window = Bracket:Window({Name = "Яuined v0.4",Enabled = true,Color = Color3.new(1,0.5,0.25),Size = UDim2.new(0,496,0,496),Position = UDim2.new(0.5,-248,0.5,-248)}) do
    
    local Tab = Window:Tab({Name = "Info",Side = "Left"}) do

        local Section = Tab:Section({Name = "Credits",Side = "Right"}) do

            Section:Label({Text = "GitHub - AlexR32 - UI library"})

            Section:Label({Text = "Discord - yellowguy24 - GUI"})
        end

        local Section = Tab:Section({Name = "Welcome",Side = "Left"}) do

            Section:Label({Text = "Welcome to the Ruined GUI. This is a simple client-sided exploit GUI that can be used for most Roblox games. Thank you for executing."})
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

            Section:Button({Name = "UNC Test",Callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/unified-naming-convention/NamingStandard/refs/heads/main/UNCCheckEnv.lua"))() end})
        end

        local Section = Tab:Section({Name = "Lighting",Side = "Right"}) do

            Section:Divider({Text = "Appearance"})

            local H, S, V = game.Lighting.Ambient:ToHSV()

            Section:Colorpicker({Name = "Ambient",Value = {H,S,V,0,false},Callback = function(HSVAR,Color3)
                game.Lighting.Ambient = (Color3) end})

            Section:Slider({Name = "Brightness",Min = 0,Max = 10,Value = 2,Callback = function(Value)
                game.Lighting.Brightness = (Value) end})

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

            local H, S, V = game.Lighting.OutdoorAmbient:ToHSV()

            Section:Colorpicker({Name = "OutdoorAmbient",Value = {H,S,V,0,false},Callback = function(HSVAR,color)
                game.Lighting.OutdoorAmbient = (color) end})

            Section:Dropdown({Name = "Technology",List = {
                {
                    Name = "Compatibility",
                    Mode = "Button",
                    Value = false,
                    Callback = function()
                        game.Lighting.Technology = Enum.Technology.Compatibility
                    end
                },
                {
                    Name = "Future",
                    Mode = "Button",
                    Value = false,
                    Callback = function()
                        game.Lighting.Technology = Enum.Technology.Future
                    end
                },
                {
                    Name = "Legacy",
                    Mode = "Button",
                    Value = false,
                    Callback = function()
                        game.Lighting.Technology = Enum.Technology.Legacy
                    end
                },
                {
                    Name = "ShadowMap",
                    Mode = "Button",
                    Value = false,
                    Callback = function()
                        game.Lighting.Technology = Enum.Technology.ShadowMap
                    end
                },
                {
                    Name = "Unified",
                    Mode = "Button",
                    Value = false,
                    Callback = function()
                        game.Lighting.Technology = Enum.Technology.Unified
                    end
                },
                {
                    Name = "Voxel",
                    Mode = "Button",
                    Value = false,
                    Callback = function()
                        game.Lighting.Technology = Enum.Technology.Voxel
                    end
                }
            }})

            Section:Divider({Text = "Data"})

            Section:Slider({Name = "ClockTime",Min = 0,Max = 24,Value = 12,Precise = 1,Callback = function(value)
                game.Lighting.ClockTime = (value) end})

            Section:Slider({Name = "GeographicLatitude",Min = 0,Max = 100,Value = 0,Callback = function(value)
                game.Lighting.GeographicLatitude = (value) end})

            Section:Divider({Text = "Exposure"})

            Section:Slider({Name = "ExposureCompensation",Min = 0,Max = 6,Value = (game.Lighting.ExposureCompensation),Precise = 1,Callback = function(value)
                game.Lighting.ExposureCompensation = (value) end})
            
            Section:Divider({Text = "Fog"})

            Section:Label({Text = "Fog does not work with all games."})

            Section:Colorpicker({Name = "FogColor",Flag = "Colorpicker",Value = {H,S,V,0,false},Callback = function(HSVAR_Table,Color3)
                local H, S, V = game.Lighting.FogColor:ToHSV()
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

            Section:Button({Name = "Kick via LocalScript",Callback = function()
                game.Players.LocalPlayer:Kick() end})

            Section:Button({Name = "Set health to 0",Callback = function()
                game.Players.LocalPlayer.Character.Humanoid.Health = 0 end})

            Section:Toggle({Name = "Anchor Root Part",Value = false,Callback = function(Toggle_Bool)
                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = (Toggle_Bool) end})

            Section:Toggle({Name = "Set Parent To Nil",Value = false,Callback = function(bool)
                if (bool) == true then
                    game.Players.LocalPlayer.Character.Parent = nil
                end
                if (bool) == false then
                    game.Players.LocalPlayer.Character.Parent = Workspace
                end
            end})

            Section:Toggle({Name = "BreakJointsOnDeath",Value = game.Players.LocalPlayer.Character.Humanoid.BreakJointsOnDeath,Callback = function(bool)
                game.Players.LocalPlayer.Character.Humanoid.BreakJointsOnDeath = (bool) end})

            Section:Toggle({Name = "UseJumpPower",Value = game.Players.LocalPlayer.Character.Humanoid.UseJumpPower,Callback = function(bool)
                game.Players.LocalPlayer.Character.Humanoid.UseJumpPower = (bool) end})

            Section:Slider({Name = "WalkSpeed",Min = 0,Max = 200,Value = 16,Callback = function(value)
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (value) end})

            Section:Slider({Name = "JumpHeight",Min = 0,Max = 100,Value = game.Players.LocalPlayer.Character.Humanoid.JumpHeight,Callback = function(value)
                game.Players.LocalPlayer.Character.Humanoid.JumpHeight = (value) end})

            Section:Slider({Name = "JumpPower",Min = 0,Max = 100,Value = 50,Callback = function(value)
                game.Players.LocalPlayer.Character.Humanoid.JumpPower = (value) end})

            Section:Slider({Name = "Gravity",Min = 0,Max = 300,Value = 196.2,Precise = 1,Callback = function(value)
                game.workspace.Gravity = (value) end})

            Section:Slider({Name = "HipHeight",Min = 0,Max = 50,Value = 2,Callback = function(value)
                game.Players.LocalPlayer.Character.Humanoid.HipHeight = (value) end})
        end
        local Section = Tab:Section({Name = "Camera",Side = "Left"}) do

            Section:Dropdown({Name = "CameraType",List = {
                {
                    Name = "Attach",
                    Mode = "Button",
                    Value = false,
                    Callback = function(option)
                        game.workspace.CurrentCamera.CameraType = Enum.CameraType.Attach
                    end
                },
                {
                    Name = "Custom",
                    Mode = "Button",
                    Value = false,
                    Callback = function(option)
                        game.workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
                    end
                },
                {
                    Name = "Fixed",
                    Mode = "Button",
                    Value = false,
                    Callback = function(option)
                        game.workspace.CurrentCamera.CameraType = Enum.CameraType.Fixed
                    end
                },
                {
                    Name = "Follow",
                    Mode = "Button",
                    Value = false,
                    Callback = function(option)
                        game.workspace.CurrentCamera.CameraType = Enum.CameraType.Follow
                    end
                },
                {
                    Name = "Orbital",
                    Mode = "Button",
                    Value = false,
                    Callback = function(option)
                        game.workspace.CurrentCamera.CameraType = Enum.CameraType.Orbital
                    end
                },
                {
                    Name = "Scriptable",
                    Mode = "Button",
                    Value = false,
                    Callback = function(option)
                        game.workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
                    end
                },
                {
                    Name = "Track",
                    Mode = "Button",
                    Value = false,
                    Callback = function(option)
                        game.workspace.CurrentCamera.CameraType = Enum.CameraType.Track
                    end
                },
                {
                    Name = "Watch",
                    Mode = "Button",
                    Value = false,
                    Callback = function(option)
                        game.workspace.CurrentCamera.CameraType = Enum.CameraType.Watch
                    end
                }
            }})

            Section:Slider({Name = "FieldOfView",Min = 0,Max = 120,Value = game.workspace.CurrentCamera.FieldOfView,Callback = function(value)
                game.workspace.CurrentCamera.FieldOfView = (value) end})
        end
    end

    local Tab = Window:Tab({Name = "Game"}) do
        local Section = Tab:Section({Name = "Note",Side = "Left"}) do
            
            Section:Label({Text = "If the game you're playing is supported by Ruined, the options for that game will appear here."})
        end
        if game.PlaceId == 108972860441201 then

            local Section = Tab:Section({Name = "Winter Russian District",Side = "Left"}) do

                Section:Toggle({Name = "Disable Map Barriers",Value = false,Callback = function(bool)
                    for _, wall in ipairs(game.workspace.invisible_walls:GetChildren()) do
                        if wall.Name:lower():match("invisible_wall") then
                            wall.CanCollide = not (bool)
                        end
                    end
                end})
                Section:Toggle({Name = "Snowfall",Value = false,Callback = function(bool)
                    if (bool) == true then
                        game.ReplicatedStorage.snowfall.Parent = game.workspace
                    end
                    if (bool) == false then
                        game.workspace.snowfall.Parent = game.ReplicatedStorage
                    end
                end})
                Section:Dropdown({Name = "Time",List = {
                    {
                        Name = "Night",
                        Mode = "Button",
                        Value = false,
                        Callback = function()
                            game.Lighting.Sky.SkyboxFt = "rbxassetid://317661263"
                            game.Lighting.Sky.SkyboxRt = "rbxassetid://317661124"
                            game.Lighting.Sky.SkyboxBk = "rbxassetid://317661184"
                            game.Lighting.Sky.SkyboxLf = "rbxassetid://317661222"
                            game.Lighting.Sky.SkyboxUp = "rbxassetid://317661299"
                            game.Lighting.Sky.SkyboxDn = "rbxassetid://317661349"
                            game.Lighting.Sky.CelestialBodiesShown = false
                            game.Lighting.Brightness = 0
                            game.Lighting.Ambient = Color3.fromRGB(106, 74, 59)
                            game.Lighting.ColorShift_Top = Color3.fromRGB(0, 0, 0)
                            game.Lighting.OutdoorAmbient = Color3.fromRGB(66, 24, 0)
                            game.Lighting.ShadowSoftness = 0.2
                            game.Lighting.Atmosphere.Color = Color3.fromRGB(141, 107, 87)
                            game.Lighting.ClockTime = 20.1
                            game.Lighting.Atmosphere.Haze = 3.16
                        end
                    },
                    {
                        Name = "Blue Hour",
                        Mode = "Button",
                        Value = false,
                        Callback = function()
                            game.Lighting.Sky.SkyboxFt = "rbxassetid://317661263"
                            game.Lighting.Sky.SkyboxRt = "rbxassetid://317661124"
                            game.Lighting.Sky.SkyboxBk = "rbxassetid://317661184"
                            game.Lighting.Sky.SkyboxLf = "rbxassetid://317661222"
                            game.Lighting.Sky.SkyboxUp = "rbxassetid://317661299"
                            game.Lighting.Sky.SkyboxDn = "rbxassetid://317661349"
                            game.Lighting.Sky.CelestialBodiesShown = false
                            game.Lighting.Brightness = 0
                            game.Lighting.Ambient = Color3.fromRGB(66, 85, 109)
                            game.Lighting.ColorShift_Top = Color3.fromRGB(0, 0, 0)
                            game.Lighting.OutdoorAmbient = Color3.fromRGB(89, 115, 147)
                            game.Lighting.ShadowSoftness = 0.2
                            game.Lighting.Atmosphere.Color = Color3.fromRGB(119, 152, 195)
                            game.Lighting.ClockTime = 20.1
                            game.Lighting.Atmosphere.Haze = 3.16
                        end
                    }
                }})
            end
        end
        if game.PlaceId == 15269951959 then
            
            local Section = Tab:Section({Name = "Legends Battlegrounds",Side = "Left"}) do

                Section:Toggle({Name = "Disable Map Barriers",Value = false,Callback = function(bool)
                    if (bool) then
                        for _, wall in pairs(game.workspace.Map.Borders.Barriers:GetChildren()) do
	                        if wall.Name:match("Barrier") and wall:IsA("Model") then
		                        for _, new in pairs(wall:GetChildren()) do
			                        if new:IsA("Part") and new.Name:match("Part") then
				                        new.CanCollide = false
				                        new.Transparency = 1
			                        end
		                        end
	                        end
                        end
                    else
                        for _, wall in pairs(game.workspace.Map.Borders.Barriers:GetChildren()) do
	                        if wall.Name:match("Barrier") and wall:IsA("Model") then
		                        for _, new in pairs(wall:GetChildren()) do
			                        if new:IsA("Part") and new.Name:match("Part") then
				                        new.CanCollide = true
				                        new.Transparency = 0
			                        end
		                        end
	                        end
                        end
                    end
                end})
            end
        end
    end

    local OptionsTab = Window:Tab({Name = "Options"}) do
        local MenuSection = OptionsTab:Section({Name = "Menu",Side = "Left"}) do
            local UIToggle = MenuSection:Toggle({Name = "UI Enabled",Flag = "UI/Enabled",IgnoreFlag = true,
            Value = Window.Enabled,Callback = function(Bool) Window.Enabled = Bool end})
            local UIKeybind = UIToggle:Keybind({Value = "End",Flag = "UI/Keybind",DoNotClear = true})
            UIToggle:Colorpicker({Flag = "UI/Color",Value = {1,0.25,1,0,true},
            Callback = function(HSVAR,Color) Window.Color = Color end})

            local Watermark = Window:Watermark({Title = "Яuined | Executor: " .. exec .. " " .. ver .. " | User: " .. game.Players.LocalPlayer.Character.Name,Enabled = true})

            MenuSection:Toggle({Name = "Open On Load",Flag = "UI/OOL",Value = true})
            MenuSection:Toggle({Name = "Blur Gameplay",Flag = "UI/Blur",Value = false,
            Callback = function(Bool) Window.Blur = Bool end}):Keybind({Flag = "Toggle/Keybind",Value = "NONE",DoNotClear = false,Mouse = false,Callback = function(Key_String,Pressed_Bool,Toggle_Bool) end,Blacklist = {"W","A","S","D","Slash","Tab","Backspace","Escape","Space","Delete","Unknown","Backquote"}})

            MenuSection:Toggle({Name = "Stats Watermark",Value = true,Callback = function(bool)
                Watermark.Enabled = (bool) end})

            MenuSection:Button({Name = "Unload UI",Callback = function()
                Window.Enabled = false

                UIKeybind.Value = "NONE"

                task.defer(function()
                    Ruined:Destroy()
                end)
            end})
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
Window:AutoLoadConfig("Ruined")
Window:SetValue("UI/Enabled",Window.Flags["UI/OOL"])

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Яuined";
    Text = "GUI Loaded";
    Duration = 5
})
if exec ~= nil then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Executor";
        Text = exec .. " " .. ver;
        Duration = 5
    })
end