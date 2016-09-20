require "object"

mov = {}

function mov.updateX(posishn, side, speed)
	if side == "l " then side = -1 
	elseif side == "r " then side = 1 end
	obj.y = posishn
	obj.x = obj.x + speed * side
end

function mov.updateXY(movSpeed, zoomSpeed)
	obj.width = obj.width + zoomSpeed
	obj.height = obj.height + zoomSpeed
	obj.length = obj.length + zoomSpeed
	obj.y = obj.y + movSpeed
	obj.x = obj.x + movSpeed
end