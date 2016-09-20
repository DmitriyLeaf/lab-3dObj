coord ={
			x = 0,
			y = 0,
			interval = 10,
		}

function coord.draw()
	love.graphics.line(coord.x, coord.y, width, coord.y)
	love.graphics.line(coord.x, coord.y, coord.x, height)
	
	for i = 0, width, coord.interval do
		love.graphics.line(coord.x + i, coord.y, coord.x + i, coord.y + coord.interval/2)
	end
	for i = 0, height, coord.interval do
		love.graphics.line(coord.x, coord.y + i, coord.x + coord.interval/2, coord.y + i)
	end
end