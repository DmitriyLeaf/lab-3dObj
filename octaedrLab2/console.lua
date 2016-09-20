require "object"
require "drawFifty"
require "mov"
local suit = require 'suit'
local input = {text = ""}

consol= {}

consPoint = "off"
colorVisib = false
colorInvis = false
coordXYZ = false
zoom = false
fiftyOn = false
movX = false
movXY = false

function consol.update(k)
	if consPoint == "on" then
		suit.layout:reset(20, height - 35)
		suit.Input(input, suit.layout:row(width - 30, 30))
		suit.Label(input.text, {align = "left"}, suit.layout:row())
		
		if input.text == "colorVisib " then
			colorVisib = true
		elseif input.text == "colorInvis " then
			colorInvis = true
		elseif input.text == "coordXYZ " then
			coordXYZ = true
		elseif input.text == "zoom " then
			zoom = true
		elseif input.text == "fifty " then
			fiftyOn = true
		elseif input.text == "movX " then
			movX = true
			--obj.x = 0
		elseif input.text == "movXY " then
			movXY = true
			obj.x = 0
			obj.y = 0
		end
		
		if colorVisib == true then
			if string.len(input.text) == 22 then
				obj.colorVisibR = string.sub(input.text, 12 , 14)
				obj.colorVisibG = string.sub(input.text, 16 , 18)
				obj.colorVisibB = string.sub(input.text, 20 , 22)
				--obj.colorVisibR = consoleText
			end
		end
		if colorInvis == true then
			if string.len(input.text) == 22 then
				obj.colorInvisR = string.sub(input.text, 12 , 14)
				obj.colorInvisG = string.sub(input.text, 16 , 18)
				obj.colorInvisB = string.sub(input.text, 20 , 22)
				--obj.colorVisibR = consoleText
			end
		end
		if coordXYZ == true then
			if string.len(input.text) == 23 then
				obj.x = string.sub(input.text, 10, 13)
				obj.y = string.sub(input.text, 15, 18)
				obj.z = string.sub(input.text, 20, 23)
			end
		end
		if zoom == true then
			if string.len(input.text) == 9 then
				obj.width = obj.width + string.sub(input.text, 6, 9)
				obj.height = obj.height + string.sub(input.text, 6, 9)
				obj.length = obj.length + string.sub(input.text, 6, 9)
				zoom = false
			end
		end
		if fiftyOn == true then 
			fifty.init()
			fiftyOn = "start"
		end
		if movX == true then
			if string.len(input.text) == 15 then
				mov.updateX(string.sub(input.text, 6, 9), 
						    string.sub(input.text, 11, 12), 
						    string.sub(input.text, 13, 15))
			end
		end
		if movXY == true then
			if string.len(input.text) == 13 then
				mov.updateXY(string.sub(input.text, 7, 9), 
							 string.sub(input.text, 11, 13))
			end
		end
		--suit.layout:row()
		--if suit.Button("Close", suit.layout:row()).hit then
		--    love.event.quit()
		--end
	end
	
end

function consol.keypressed(key, unicode)
	if key == "kpenter" and consPoint == "off" then
		consPoint = "on"
	elseif key == "kpenter" and consPoint == "on" then
		consPoint = "off"
		colorVisib = false
		colorInvis = false
		coordXYZ = false
		zoom = false
		fiftyOn = false
		movX = false
		movXY = false
		input.text = ""
	end
	
	if consPoint == "on" then
		suit.keypressed(key)
	end
end

function consol.textinput(t)
	if consPoint == "on" then
		suit.textinput(t)
	end
end

function consol.draw()
	if fiftyOn == "start" then
		fifty.draw()
	else 
		obj.draw()
	end
	
	if consPoint == "on" then
		suit.draw()
	end
end