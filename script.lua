local Player = game.Players.LocalPlayer

local function NewGui(Id, Title, Visible)
	
	local Gui = Instance.new("ScreenGui", Player.PlayerGui)
	Gui.Name = Id
	Gui.Enabled = true
	
	local Frame = Instance.new("Frame", Gui)
	Frame.Visible = true
	Frame.BackgroundColor3 = Color3.new(0.439216, 0.439216, 0.439216)
	Frame.Position = UDim2.new(0.202, 0, 0.305, 0)
	Frame.Size = UDim2.new(0.392, 0, 0.574, 0)
	Frame.BorderSizePixel = 0
	
	local UIDragDetector = Instance.new("UIDragDetector", Frame)
	
	local UICorner = Instance.new("UICorner", Frame)
	UICorner.CornerRadius = UDim.new(0, 8)
	
	local UIStroke = Instance.new("UIStroke", Frame)
	UIStroke.Color = Color3.new(0, 0, 0)
	UIStroke.Thickness = 3
	UIStroke.Transparency = 0
	UIStroke.Enabled = true
	
	local Buttons = Instance.new("ScrollingFrame", Frame)
	Buttons.Name = "Buttons"
	Buttons.BackgroundTransparency = 1
	Buttons.Position = UDim2.new(0.022, 0, 0.215, 0)
	Buttons.Size = UDim2.new(0.264, 0, 0.757, 0)
	Buttons.BorderSizePixel = 0
	
	local UIListLayout = Instance.new("UIListLayout", Buttons)
	UIListLayout.Padding = UDim.new(0, 4)
	
	local Title2 = Instance.new("TextLabel", Frame)
	Title2.Name = "Title"
	Title2.Text = Title
	Title2.BackgroundTransparency = 1
	Title2.Position = UDim2.new(0, 0, 0, 0)
	Title2.Size = UDim2.new(1, 0, 0.188, 0)
	Title2.Visible = true
	Title2.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title2.TextScaled = false
	Title2.TextSize = 40
	Title2.RichText = true
	
	local UICorner = Instance.new("UICorner", Title2)
	UICorner.CornerRadius = UDim.new(0, 8)

	local UIStroke = Instance.new("UIStroke", Title2)
	UIStroke.Color = Color3.new(0, 0, 0)
	UIStroke.Thickness = 3
	UIStroke.Transparency = 0
	UIStroke.Enabled = true
	UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
	
	local UIStroke = Instance.new("UIStroke", Title2)
	UIStroke.Color = Color3.new(0, 0, 0)
	UIStroke.Thickness = 3
	UIStroke.Transparency = 0
	UIStroke.Enabled = true
	UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	
	local Close = Instance.new("TextButton",Frame)
	Close.BackgroundTransparency = 0.35
	Close.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Close.Visible = true
	Close.Position = UDim2.new(0.878, 0, 0.007, 0)
	Close.Size = UDim2.new(0.098, 0, 0.174, 0)
	Close.Text = "x"
	Close.TextColor3 = Color3.fromRGB(255, 255, 255)
	Close.TextScaled = true
	
	local UICorner = Instance.new("UICorner", Close)
	UICorner.CornerRadius = UDim.new(1, 0)
	
	local Hide = Instance.new("TextButton",Frame)
	Hide.BackgroundTransparency = 0.35
	Hide.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Hide.Visible = true
	Hide.Position = UDim2.new(0.76, 0, 0.007, 0)
	Hide.Size = UDim2.new(0.098, 0, 0.174, 0)
	Hide.Text = "-"
	Hide.TextColor3 = Color3.fromRGB(255, 255, 255)
	Hide.TextScaled = true

	local UICorner = Instance.new("UICorner", Hide)
	UICorner.CornerRadius = UDim.new(1, 0)
	
	local Pages = Instance.new("Frame", Frame)
	Pages.Name = "Pages"
	Pages.BackgroundTransparency = 1
	Pages.BorderSizePixel = 0
	Pages.Position = UDim2.new(0.31, 0, 0.215, 0)
	Pages.Size = UDim2.new(0.619, 0, 0.733, 0)
	
	return Gui
	
end

local function ConfigGui(Id, Config)
	
	local Gui = Player.PlayerGui:WaitForChild(Id)
	
	local Title = Config["Title"]
	local Visible = Config["Visible"]
	local Id = Config["Id"]
	
	if Title ~= nil then
		Gui.Frame.Title.Text = Title
	end
	
	if Visible ~= nil then
		Gui.Enabled = Visible
	end
	
	if Id ~= nil then
		Gui.Name = Id
	end
	
end

local function DestroyGui(Id)
	Player.PlayerGui:WaitForChild(Id):Destroy()
end

local function AddPage(GuiId, PageId, Text)
	
	local Gui = Player.PlayerGui:WaitForChild(GuiId)
	
	local Button = Instance.new("TextButton", Gui.Frame.Buttons)
	Button.Size = UDim2.new(0, 112, 0, 40)
	Button.BackgroundTransparency = 0.5
	Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Button.Text = Text
	Button.Name = PageId
	Button.TextScaled = true
	Button.RichText = true
	Button.TextColor3 = Color3.new(1, 1, 1)
	
	local UICorner = Instance.new("UICorner", Button)
	UICorner.CornerRadius = UDim.new(0, 8)
	
	local Pages = Gui.Frame.Pages
	local AllPages = #Pages:GetChildren()
	
	local Page = Instance.new("ScrollingFrame", Pages)
	Page.Name = PageId
	Page.BackgroundTransparency = 1
	Page.BorderSizePixel = 0
	Page.Position = UDim2.new(0, 0, 0, 0)
	Page.Size = UDim2.new(1, 0, 1, 0)
	
	local UIListLayout = Instance.new("UIListLayout", Page)
	UIListLayout.Padding = UDim.new(0, 4)
	
	if AllPages == 0 then
		Page.Visible = true
	else
		Page.Visible = false
	end
	
	Button.MouseButton1Up:Connect(function()
		for _, page in pairs(Gui.Frame.Pages:GetChildren()) do
			page.Visible = false
		end
		Page.Visible = true
	end)
	
	return Page
	
end

local function AddButton(GuiId, PageId, ButtonId, ButtonText)
	
	local Gui = Player.PlayerGui:WaitForChild(GuiId)
	local Page = Gui.Frame.Pages:WaitForChild(PageId)
	
	local Button = Instance.new("TextButton", Page)
	Button.Name = ButtonId
	Button.Text = ButtonText
	Button.Size = UDim2.new(0.93, 0, 0.15, 0)
	Button.TextColor3 = Color3.new(1, 1, 1)
	Button.TextScaled = true
	Button.RichText = true
	Button.BackgroundTransparency = 0.5
	Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Button.BorderSizePixel = 0	
	
	local UICorner = Instance.new("UICorner", Button)
	UICorner.CornerRadius = UDim.new(0, 8)
	
	return Button
	
end

-- Here your script!
