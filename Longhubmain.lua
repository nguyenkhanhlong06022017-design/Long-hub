local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Long Hub | Plane Simulator Fix",
   LoadingTitle = "Đang vá lỗi Speed/Jump...",
   LoadingSubtitle = "by Gemini AI",
   ConfigurationSaving = { Enabled = false }
})

-- Biến lưu trữ giá trị
local _G = getgenv()
_G.Speed = 16
_G.Jump = 50
_G.LoopSpeed = false

-- Vòng lặp để ép chỉ số (Tránh bị game reset)
spawn(function()
    while wait() do
        pcall(function()
            if _G.LoopSpeed then
                local char = game.Players.LocalPlayer.Character
                if char and char:FindFirstChild("Humanoid") then
                    char.Humanoid.WalkSpeed = _G.Speed
                    char.Humanoid.JumpPower = _G.Jump
                    -- Fix cho một số game dùng JumpHeight
                    if char.Humanoid.UseJumpPower == false then
                        char.Humanoid.JumpHeight = _G.Jump / 3
                    end
                end
            end
        end)
    end
end)

local Tab = Window:CreateTab("Người chơi", 4483362458)

local Toggle = Tab:CreateToggle({
   Name = "Kích hoạt Mod (Bật cái này mới có tác dụng)",
   CurrentValue = false,
   Flag = "ModToggle",
   Callback = function(Value)
      _G.LoopSpeed = Value
   end,
})

local Slider = Tab:CreateSlider({
   Name = "Tốc độ chạy",
   Range = {16, 300},
   Increment = 1,
   Suffix = " Speed",
   CurrentValue = 16,
   Callback = function(Value)
      _G.Speed = Value
   end,
})

local SliderJump = Tab:CreateSlider({
   Name = "Độ cao nhảy",
   Range = {50, 500},
   Increment = 1,
   Suffix = " Power",
   CurrentValue = 50,
   Callback = function(Value)
      _G.Jump = Value
   end,
})

local TabMisc = Window:CreateTab("Tiện ích", 4483362458)

local ButtonInfinite = TabMisc:CreateButton({
   Name = "Bật Nhảy Vô Hạn",
   Callback = function()
      game:GetService("UserInputService").JumpRequest:Connect(function()
          game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping")
      end)
   end,
})
