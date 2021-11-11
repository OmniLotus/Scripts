--------// Game Functions
local gameFunc={}

function gameFunc.IslandofMove()
	game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("StrikeAPose")
	game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("SettingTheStage")
	game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("DIY")
	game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("GetMoving")
	game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("VictoryLap")
end

function gameFunc.RobloxCommunitySpace()
	game:GetService("ReplicatedStorage").TasksList.RemoteEvents.AwardBadge:FireServer()
end

function gameFunc.ccpGame1()
	while true do
		wait()
		for _,v in pairs(game:GetService("Workspace").obby.Badge:GetDescendants()) do
			if v:IsA("TouchTransmitter") then
				touchInterest(v.Parent)
			end
		end


		for i=1,4 do
			local args = {
				[1] = 2,
				[2] = {
					[1] = 2,
					[2] = i
				}
			}

			game:GetService("ReplicatedStorage").Project.RemoteEvent.ControlMessageEvent:FireServer(unpack(args))
		end
	end
end

function gameFunc.MansionofWonder()
	game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("Boardwalk")
	game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("FXArtist")
	game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("ParticleWizard")
	game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("ThingsGoBoom")
end

function gameFunc.RobloxCreatorChallenge()
	game:GetService("ReplicatedStorage").Events.FinishQuiz:InvokeServer("Lesson1")
	game:GetService("ReplicatedStorage").Events.FinishQuiz:InvokeServer("Lesson2")
	game:GetService("ReplicatedStorage").Events.FinishQuiz:InvokeServer("Lesson3")
	game:GetService("ReplicatedStorage").Events.FinishQuiz:InvokeServer("Lesson4")
	game:GetService("ReplicatedStorage").Events.FinishQuiz:InvokeServer("Lesson5")
	game:GetService("ReplicatedStorage").Events.FinishQuiz:InvokeServer("Lesson6")
end

function gameFunc.ccpGame2()
	--Get Kid Neza
	local path=game:GetService("Workspace").nezha.NezhaTouch
	touchInterest(path)
end

function gameFunc.BakuganLaunchParty()

	--Idk if this gives anything but it exists
	for i=1,10 do
		game:GetService("ReplicatedStorage").RemoteEvent:FireServer("Claim", i)
	end
	game:GetService("ReplicatedStorage").RemoteEvent:FireServer("ClaimFreeRewards")
end

function gameFunc.BeattheScammers()
	for i,v in pairs( game:GetService("Workspace").Clues:GetChildren() ) do
		local part
		local dialog
		for i2,v2 in pairs( v:GetDescendants() ) do
			if v2.Name=="RobloxDialogue" then
				dialog=v2
			elseif v2.ClassName=="Part" then
				part=v2
			end
		end

		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=part.CFrame
		wait(0.2)
		game:GetService("ReplicatedStorage").RobloxDialogue.Remotes.DialogueRequested:FireServer(dialog)
		wait()
		game:GetService("ReplicatedStorage").RobloxDialogue.Remotes.DialogueResponseChosen:FireServer(1)
		wait()
	end
end

function gameFunc.ccpGame3()
	--// Scales
	for i,v in pairs( game:GetService("Workspace").Collectibles:GetChildren() ) do
		touchInterest( v )
	end

	--// Money
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame=game:GetService("Workspace").ObstacleCourse.ObstacleEnd.Part.CFrame
	wait(0.5)
	for i=1,150 do
		task.wait()
		touchInterest( game:GetService("Workspace").ObstacleCourse.ObstacleEntries.Part )
		touchInterest( game:GetService("Workspace").ObstacleCourse.ObstacleEnd.Part )
	end

	--// Buying All items that can be equipped in roblox
	while true do
		--just in case they somehow didnt get enough cash
		touchInterest( game:GetService("Workspace").ObstacleCourse.ObstacleEntries.Part )
		touchInterest( game:GetService("Workspace").ObstacleCourse.ObstacleEnd.Part )
		game:GetService("ReplicatedStorage").RemoteEvent:FireServer("PurchaseWithCoins", "clothing1")
		game:GetService("ReplicatedStorage").RemoteEvent:FireServer("PurchaseWithCoins", "accessory13")
		game:GetService("ReplicatedStorage").RemoteEvent:FireServer("PurchaseWithCoins", "accessory14")
		game:GetService("ReplicatedStorage").RemoteEvent:FireServer("PurchaseWithCoins", "accessory12")
		wait(0.25)
	end
end











--------// Converting
--[[
local function convByte( str )
	local conv=""
	
	for i,codepoint in utf8.codes(str) do 
		conv=conv..codepoint.."/"
	end
	
	return conv
end

print( convByte("七叔（叶泽浩）Launch Party") )
]]

--------// Functions
local function CreateInstance(cls,props)
	local inst = Instance.new(cls)
	for i,v in pairs(props) do
		inst[i] = v
	end
	return inst
end

local function convChar( str )
	local converted=""

	for word in string.gmatch(str, "%d*") do 
		if word~="" then
			converted=converted..utf8.char(tostring(word))
		end
	end

	return converted
end

local function tp( gameID )
	local connection
	connection = game:GetService("TeleportService").TeleportInitFailed:Connect(function(player, teleportResult, errorMessage)
		warn("Teleport Failed | Game Link Copied to Clipboard")
		setclipboard( "https://www.roblox.com/games/"..gameID )
		connection:Disconnect()
	end)
	game:GetService("TeleportService"):Teleport( gameID )
end

local function createButton( gameName,tab )
	if tab[3]~=nil then
		gameName=convChar(tab[3])
	end

	local TextButton=CreateInstance('TextButton',{Name=gameName,TextWrapped=true,TextColor3=Color3.new(1, 0.443137, 0.443137),TextStrokeColor3=Color3.new(1, 1, 1),Text=gameName,Font=Enum.Font.SourceSans,Parent=ScrollingFrame,Size=UDim2.new(1, 0, 0, 50),BorderColor3=Color3.new(0.627451, 0.278431, 0.278431),AutomaticSize=Enum.AutomaticSize.Y,TextSize=20,BackgroundColor3=Color3.new(0.211765, 0.211765, 0.211765),})
	TextButton.MouseButton1Click:Connect(function()
		if tab[1]==game.PlaceId then
			warn( "Running Game Function" )
			tab[2]()

		else
			tp( tab[1] )

		end
	end)

end

function touchInterest(part)
	firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, part, 0) --0 is touch
	wait()
	firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, part, 1) -- 1 is untouch
end


--------// Game Shit
local games={
	--// Vry Epix Chinese Games
	["凹凸世界：自由丛林"]					 ={7541759836,gameFunc.ccpGame1,"20985/20984/19990/30028/65306/33258/30001/19995/26519"},
	["Luobu Mystery Box Hunt"]				={7232621271,gameFunc.ccpGame2},
	["七叔（叶泽浩）Launch Party"]			 ={7277488595,gameFunc.ccpGame3,"19971/21460/65288/21494/27901/28009/65289/76/97/117/110/99/104/32/80/97/114/116/121"},
	
	--// Copy paste quiz game
	["RCC"]									={1871632192,gameFunc.RobloxCreatorChallenge},
	["RCC Space"]							={4201429814,gameFunc.RobloxCreatorChallenge},
	["Roblox Creator Quiz"]					={3204381131,gameFunc.RobloxCreatorChallenge},
	["RCC Libary"]							={2546610365,gameFunc.RobloxCreatorChallenge},

	--// Other
	["Island of Move"]						={5306359293,gameFunc.IslandofMove},
	["Roblox Community Space"]				={6985028626,gameFunc.RobloxCommunitySpace},
	["Mansion of Wonder"]					={6901029464,gameFunc.MansionofWonder},
	["Bakugan Launch Party"]				={7234162497,gameFunc.BakuganLaunchParty},
	["Beat the Scammers!"]					={5450795073,gameFunc.BeattheScammers},
	["Tai Verdes Concert"]					={7619937171,gameFunc.TaiVerdesConcert},
}



--------// Get Event
coroutine.wrap(function()
	local gid=game.PlaceId
	for i,tab in pairs( games ) do
		if tab[1]==gid then
			warn( "Running Game Function" )
			tab[2]()
			break
		end
	end
end)()

--------// Create UI
local ScreenGui=CreateInstance('ScreenGui',{Parent=game:GetService("CoreGui"),ZIndexBehavior=Enum.ZIndexBehavior.Sibling,})
ScrollingFrame=CreateInstance('ScrollingFrame',{ScrollBarImageColor3=Color3.new(0, 0, 0),Active=true,AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollBarThickness=0,Parent=ScreenGui,Position=UDim2.new(0, 0, 0.14152047, 0),Size=UDim2.new(0, 224, 0, 595),BorderColor3=Color3.new(0.627451, 0.278431, 0.278431),BackgroundColor3=Color3.new(0, 0, 0),CanvasSize=UDim2.new(0, 0, 0, 0),})
local UIListLayout=CreateInstance('UIListLayout',{Parent=ScrollingFrame,SortOrder=Enum.SortOrder.Name,})

for name,tab in pairs( games ) do
	createButton( name,tab )
end
