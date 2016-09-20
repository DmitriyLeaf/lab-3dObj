require "object"
require "coord"

local suit = require 'suit'
local input = {text = ""}

width = love.graphics.getWidth()
height = love.graphics.getHeight()

console = "off"
colorVisib = false
colorInvis = false
coordXYZ = false
zoom = false

xRead, yRead, zRead, widt, heig, leng = 300, 100, 0, 400, 400, 400

function love.load()
	obj.init(xRead, yRead, zRead, widt, heig, leng)
end

function love.update(k)
----------------------------------------------------------
	if console == "on" then
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
				obj.widht = obj.widht + string.sub(input.text, 6, 9)
				obj.height = obj.height + string.sub(input.text, 6, 9)
				obj.length = obj.length + string.sub(input.text, 6, 9)
				zoom = false
			end
		end
		--suit.layout:row()
		--if suit.Button("Close", suit.layout:row()).hit then
		--    love.event.quit()
		--end
	end
	
----------------------------------------------------------
	width = love.graphics.getWidth()
	height = love.graphics.getHeight()
	
	obj.operation()
	obj.initTop()
end

function love.keypressed(key, unicode)
	if key == "escape" then
		love.event.quit()
	end
	if key == "f" then
		love.window.setFullscreen(fullScreen, desktop)
		if fullScreen == false then fullScreen = true else fullScreen = false end
	end
---------------------------------------------------------
	if key == "kpenter" and console == "off" then
		console = "on"
	elseif key == "kpenter" and console == "on" then
		console = "off"
		colorVisib = false
		colorInvis = false
		coordXYZ = false
		zoom = false
		input.text = ""
	end
	
	if console == "on" then
		suit.keypressed(key)
	end
---------------------------------------------------------
end

function love.textinput(t)
    suit.textinput(t)
end

function love.draw()
---------------------------------------------------------
	if console == "on" then
		suit.draw()
	end
--------------------------------------------------------
	--love.graphics.print(string.len(consoleText))
	coord.draw()
	obj.draw()
end