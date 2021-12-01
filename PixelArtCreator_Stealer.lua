do
	local imports = {
	["{C2D3C42D-D69C-4570-BFDD-9A77B2F3626D}"] = function()local stealer={}


local function toHex(color3)
	return string.format("%02X%02X%02X", color3.R * 255, color3.G * 255, color3.B * 255)
end
local function convertStrip(inst, tab)
	local num=#tab
	for i=num+1, num+(inst.AbsoluteSize.Y/inst.AbsoluteSize.X) do
		tab[i]=toHex(inst.BackgroundColor3)
	end
	return tab
end
local function paint( board, hexColour, pixelNumber )
	game:GetService("ReplicatedStorage").Port:FireServer("ApplyColor", board.Pixels, hexColour, pixelNumber)
end
local function getLocalPlot()
	for i,v in pairs( game:GetService("Workspace").DrawBoards.DrawBoards:GetChildren() ) do
		if v.name.Value==game:GetService('Players').LocalPlayer.Name then
			return v
		end
	end
end



function stealer.plot( boardPath )
	-- Getting Hex
	local hex={}
	for i,v in pairs( boardPath.Pixels:GetChildren() ) do
		if tonumber(v.Name)~=nil then
			hex[tonumber(v.Name)]=v.HexColor.Value
		end
	end
	
	
	-- Saving
	hex=game:GetService("HttpService"):JSONEncode(hex)
	return hex
end




function stealer.gui( guiPath )
	local tab={}
	
	
	-- Converting gui into hex
	for i,v in pairs( guiPath:GetChildren() ) do
		if tonumber(v.Name)~=nil then
			tab=convertStrip(v, tab)
		end
	end
	
	
	-- Saving
	tab=game:GetService("HttpService"):JSONEncode(tab)
	return tab
end




function stealer.save( path )
	assert(path, "An instance is needed.")
	local hex
	-- Plot
	if path.ClassName=="Model" then
		hex=stealer.plot(path)
		setclipboard(hex)
		print( "Finished Saving |",path:GetFullName() )
		
		
	-- Guis
	elseif path.ClassName=="Frame" then
		hex=stealer.gui(path)
		setclipboard(hex)
		print( "Finished Saving |",path:GetFullName() )
		
	else
		error( "Couldn't save" )
		
		
	end
	
	return hex
end



function stealer.paste( json, bigPlot )
	-- Decoding jsonString and making sure it was done correctly
	local colours=assert( game:GetService("HttpService"):JSONDecode(json),"Couldn't decode json." )
	
	-- Getting Board
	local board
	if not bigPlot then
		board=getLocalPlot()
		
	else
		board=game:GetService("Workspace").PublicBoard
	end
	
	-- Painting
	for i,v in pairs( colours ) do
		pcall(function()
			if board.Pixels:FindFirstChild(i).HexColor.Value~=v then
				paint( board, v, i )
			end
		end)
	end
end



function stealer.load( jsonString )
	if string.len(jsonString)==90001 then
		stealer.paste(jsonString, true)
		print( "Finished Loading" )

	else
		stealer.paste(jsonString, false)
		print( "Finished Loading" )
		
	end
end




function stealer.steal( path )
	-- Saving & Loading
	assert(path, "An instance is needed.")
	local hex=stealer.save(path)
	stealer.load(hex)
	
	-- Printing
	local text
	pcall(function()
		text=path.Name
	end)
	pcall(function()
		text=path.Parent.Parent.TitleAuthor.Text
	end)
	print( "Finished Stealing |",text )
	
end
return stealer end,
}

	local o_require = require
	setmetatable(imports, {
		__index = function(self, k) 
			return function() 
				return o_require(k) 
			end
		end
	})
	
	function require(source)
		return imports[source]()
	end
end

return require("{C2D3C42D-D69C-4570-BFDD-9A77B2F3626D}")
