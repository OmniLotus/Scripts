local console={}

--// Renamed Functions // almost copy paste
console.print=rconsoleprint
console.warn=rconsolewarn
console.error=rconsoleerr
console.name=rconsolename or consolesettitle
console.clear=rconsoleclear
console.close=rconsoleclose

--// Colour table //  Fuck script-ware all my homies hate script-ware. But seriously how do i colour in script-ware?
console.colours={
	["black"]="@@BLACK@@",
	["blue"]="@@BLUE@@",
	["green"]="@@GREEN@@",
	["cyan"]="@@CYAN@@",
	["red"]="@@RED@@",
	["magenta"]="@@MAGENTA@@",
	["brown"]="@@BROWN@@",
	["lgrey"]="@@LIGHT_GRAY@@",
	["dgrey"]="@@DARK_GRAY@@",
	["lblue"]="@@LIGHT_BLUE@@",
	["lgreen"]="@@LIGHT_GREEN@@",
	["lcyan"]="@@LIGHT_CYAN@@",
	["lred"]="@@LIGHT_RED@@",
	["lmagenta"]="@@LIGHT_MAGENTA@@",
	["yellow"]="@@YELLOW@@",
	["white"]="@@WHITE@@",
}

--// Converting Functions
function console.convertColour(colour)
	local lowStr=string.lower(colour)
	return console.colours[lowStr]
end

function console.switchColour(colour)
	colour=string.gsub(colour, "@", "")
	colour=console.convertColour(colour)

	console.print(colour)
end

--// Interacting functions
function console.output(strOriginal, newLine)
	local lines=string.split(strOriginal, "\n")

	for i,str in pairs( lines ) do
		if string.sub(str, 1, 2)=="@@" then
			console.switchColour(str)

		else
			console.print(str)

		end
	end

	if newLine==true then
		console.print("\n")
	end
end

function console.minify(str)
	str=string.gsub( str,"\n","\\n" )
	console.print(str)
end

return console
