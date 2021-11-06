local loplr=game:GetService("Players").LocalPlayer
local bannedItems={
	--// Lv 350 Weapons
	"Shadow Reaper","Great Sword of Darkness","Blade of Infinity","Wand of Perception","Bow of Legion","Skywar Staff"
}


local function findName( str )
	local itemName=string.gsub(str, "  ", " ")
	if table.find( bannedItems,itemName )~=nil then
		return true
	else
		return false
	end
end

local function addValue( str,value )
	if tempTab[str]==nil then
		tempTab[str]=value
	else
		tempTab[str]=tempTab[str]+value
	end
end

local function getItems( player )
	tempTab={}
	for i,inst in pairs( player.PlayerStats:GetChildren() ) do
		--// Ruler Armour
		if string.find(inst.Name, "Ruler of")~=nil and inst.Value~=0 then
			addValue( inst.Name, inst.Value )
	
		--// Illegal Items  | Inventory
		elseif findName( inst.Name )==true and inst.Value~=0 then
			addValue( inst.Name, inst.Value )
	
		--// Illegal Items  | Using
		elseif findName( inst.Value )==true then
			print( inst.Value )
			addValue( inst.Value, 1 )
		end
	end

	return tempTab
end

local function folderCheck(name,dir)
	if not isfolder(dir..name) then
		makefolder(dir.."/"..name)
	end
end

folderCheck("LotusSaved","")
writefile( "LotusSaved/SoloLeveling.txt", "" )
for i,plr in pairs( game:GetService("Players"):GetChildren() ) do
	local tab=getItems( plr )
	if (next(tab) ~= nil)==true then
		appendfile( "LotusSaved/SoloLeveling.txt", plr.Name.."\n" )

		for i,v in pairs( tab ) do
			appendfile( "LotusSaved/SoloLeveling.txt", i.." | "..v.."\n" )
		end
		appendfile( "LotusSaved/SoloLeveling.txt", "\n" )
	end
end
