require "object"
require "coord"
require "console"

width = love.graphics.getWidth()
height = love.graphics.getHeight()

xRead, yRead, zRead, widt, heig, leng, firCol, secCol = 300, 100, 0, 400, 400, 400, 100, 255

function love.load()
	obj.init(xRead, yRead, zRead, widt, heig, leng, firCol, firCol, firCol, secCol, secCol, secCol)
end

function love.update(k)
----------------------------------------------------------
	consol.update(k)
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
	consol.keypressed(key, unicode)
---------------------------------------------------------
end

function love.textinput(t)
    consol.textinput(t)
end

function love.draw()
---------------------------------------------------------
	consol.draw()
--------------------------------------------------------
	--love.graphics.print(string.len(consoleText))
	coord.draw()
	--[[for i = 0,24 do
		obj.draw(   obj.a.x + math.random(1, width), obj.a.y + math.random(1, height), obj.a.z,
					obj.b.x + math.random(1, width), obj.b.y + math.random(1, height), obj.b.z,
					obj.c.x + math.random(1, width), obj.c.y + math.random(1, height), obj.c.z,
					obj.d.x + math.random(1, width), obj.d.y + math.random(1, height), obj.d.z,
					obj.e.x + math.random(1, width), obj.e.y + math.random(1, height), obj.e.z,
					obj.f.x + math.random(1, width), obj.f.y + math.random(1, height), obj.f.z)
	end]]--
end