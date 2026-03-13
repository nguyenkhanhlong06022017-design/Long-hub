local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "My First Script Hub",
   LoadingTitle = "Đang tải dữ liệu...",
   LoadingSubtitle = "by Gemini AI",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "GeminiScripts", -- Tên thư mục lưu cài đặt
      FileName = "MyScript"
   }
})

local Tab = Window:CreateTab("Tính năng chính", 4483362458) -- Icon ID

local Button = Tab:CreateButton({
   Name = "Nhảy cao (Jump Power)",
   Callback = function()
      -- Đoạn code xử lý khi bấm nút
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = 100
      game.Players.LocalPlayer.Character.Humanoid.UseJumpPower = true
      Rayfield:Notify({
         Title = "Thành công!",
         Content = "Bạn đã kích hoạt Nhảy cao",
         Duration = 5,
         Image = 4483362458,
      })
   end,
})

local Slider = Tab:CreateSlider({
   Name = "Tốc độ chạy (WalkSpeed)",
   Range = {16, 200},
   Increment = 1,
   Suffix = " Speed",
   CurrentValue = 16,
   Flag = "Slider1", 
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})
