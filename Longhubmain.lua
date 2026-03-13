local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Long Hub | Plane Simulator",
   LoadingTitle = "Đang kiểm tra dữ liệu Game...",
   LoadingSubtitle = "by Gemini AI",
   ConfigurationSaving = { Enabled = false }
})

local Tab = Window:CreateTab("Người chơi", 4483362458)

local Slider = Tab:CreateSlider({
   Name = "Tốc độ chạy",
   Range = {16, 300},
   Increment = 1,
   Suffix = " Speed",
   CurrentValue = 16,
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

local SliderJump = Tab:CreateSlider({
   Name = "Độ cao nhảy",
   Range = {50, 500},
   Increment = 1,
   Suffix = " Power",
   CurrentValue = 50,
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
      game.Players.LocalPlayer.Character.Humanoid.UseJumpPower = true
   end,
})

local TabMisc = Window:CreateTab("Tiện ích", 4483362458)

local ButtonInfinite = TabMisc:CreateButton({
   Name = "Bật Nhảy Vô Hạn (Fly)",
   Callback = function()
      -- Tính năng giúp bạn bay lên cao bằng cách spam nút nhảy
      game:GetService("UserInputService").JumpRequest:Connect(function()
          game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping")
      end)
      Rayfield:Notify({Title = "Thông báo", Content = "Đã bật Nhảy vô hạn!", Duration = 3})
   end,
})

Rayfield:Notify({Title = "Long Hub", Content = "Chào mừng bạn đến với Plane Simulator!", Duration = 5})
