obj = {
			x = 10,
			y = 10,
			z = 0,
			
			colorInvisR = 100,
			colorInvisG = 100,
			colorInvisB = 100,
			
			colorVisibR = 255,
			colorVisibG = 255,
			colorVisibB = 255,
			
			widht = 0,
			height = 0,
			length = 0,
			
			a = {x, y = 0, 0},
			b = {x, y = 0, 0},
			c = {x, y = 0, 0},
			d = {x, y = 0, 0},
			e = {x, y = 0, 0},
			f = {x, y = 0, 0}
		}

function obj.init(xI, yI, zI, wI, hI, lI)
	obj.x, obj.y, obj.z, obj.widht, obj.height, obj.length = xI, yI, zI, wI, hI, lI
	obj.initTop()
end

function obj.initTop()
	obj.a.x = obj.x + obj.z/math.sqrt(2)
	obj.a.y = obj.y - obj.z/math.sqrt(2)
	
	obj.b.x = obj.x + (obj.z - obj.length/2)/math.sqrt(2)
	obj.b.y = (obj.y + obj.height/2) - (obj.z - obj.length/2)/math.sqrt(2)
	
	obj.c.x = (obj.x + obj.widht/2) + obj.z/math.sqrt(2)
	obj.c.y = (obj.y + obj.height/2) - obj.z/math.sqrt(2)
	
	obj.d.x = obj.x + (obj.z + obj.length/2)/math.sqrt(2)
	obj.d.y = (obj.y + obj.height/2) - (obj.z + obj.length/2)/math.sqrt(2)
	
	obj.e.x = (obj.x - obj.widht/2) + obj.z/math.sqrt(2)
	obj.e.y = (obj.y + obj.height/2) - obj.z/math.sqrt(2)
	
	obj.f.x = obj.x + obj.z/math.sqrt(2)
	obj.f.y = (obj.y + obj.height) - obj.z/math.sqrt(2)
end

function obj.draw() 
	--love.graphics.points(obj.x + obj.z/math.sqrt(2), obj.y + obj.z/math.sqrt(2))
	--love.graphics.points(obj.x, obj.y)
	love.graphics.print("A("..obj.x..";"..obj.y..";"..obj.z..")", 
						obj.a.x, 
						obj.a.y - 13)
	love.graphics.print("B", obj.b.x - 13, obj.b.y + 13)
	love.graphics.print("C", obj.c.x, obj.c.y - 13)
	love.graphics.print("D", obj.d.x, obj.d.y - 13)
	love.graphics.print("E", obj.e.x - 13, obj.e.y - 13)
	love.graphics.print("F", obj.f.x, obj.f.y + 13)
	
	love.graphics.setColor(obj.colorInvisR, obj.colorInvisG, obj.colorInvisB)
	love.graphics.line(obj.e.x, obj.e.y, obj.d.x, obj.d.y)
	love.graphics.line(obj.e.x, obj.e.y, obj.f.x, obj.f.y)
	love.graphics.line(obj.f.x, obj.f.y, obj.d.x, obj.d.y)
	love.graphics.setColor(255, 255, 255)
	
	love.graphics.setColor(obj.colorVisibR, obj.colorVisibG, obj.colorVisibB)
	love.graphics.line(obj.e.x, obj.e.y, obj.a.x, obj.a.y)
	love.graphics.line(obj.e.x, obj.e.y, obj.b.x, obj.b.y)
	
	love.graphics.line(obj.f.x, obj.f.y, obj.b.x, obj.b.y)
	love.graphics.line(obj.f.x, obj.f.y, obj.c.x, obj.c.y)
	
	love.graphics.line(obj.a.x, obj.a.y, obj.b.x, obj.b.y)
	love.graphics.line(obj.a.x, obj.a.y, obj.d.x, obj.d.y)
	love.graphics.line(obj.a.x, obj.a.y, obj.c.x, obj.c.y)
	
	love.graphics.line(obj.c.x, obj.c.y, obj.d.x, obj.d.y)
	love.graphics.line(obj.c.x, obj.c.y, obj.b.x, obj.b.y)
	love.graphics.setColor(255, 255, 255)
end

function obj.operation()
	if love.keyboard.isDown("kp8") then
		obj.y = obj.y - 10
	elseif love.keyboard.isDown("kp2") then
		obj.y = obj.y + 10
	elseif love.keyboard.isDown("kp4") then
		obj.x = obj.x - 10
	elseif love.keyboard.isDown("kp6") then
		obj.x = obj.x + 10
	elseif love.keyboard.isDown("kp5") then
		obj.z = obj.z + 10
	elseif love.keyboard.isDown("kp0") then
		obj.z = obj.z - 10
	elseif love.keyboard.isDown("kp+") then
		obj.widht, obj.height, obj.length = obj.widht + 10, obj.height + 10, obj.length + 10
	elseif love.keyboard.isDown("kp-") then
		obj.widht, obj.height, obj.length = obj.widht - 10, obj.height - 10, obj.length - 10
	end
end

-- c^2 = 2a^2
-- a = c/√2