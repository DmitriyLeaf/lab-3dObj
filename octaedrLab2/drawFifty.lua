require "object"

fifty = {
			x = {},
			y = {},
			
			colorInvisR = {},
			colorInvisG = {},
			colorInvisB = {},
			
			colorVisibR = {},
			colorVisibG = {},
			colorVisibB = {},
			
			zoomFifty = {},
			
			width = obj.width,
			height = obj.height,
			length = obj.length
		}

function fifty.init()
	for i = 0, 49 do
		fifty.x[i] = math.random(1, width)
		fifty.y[i] = math.random(1, height)
		
		fifty.colorInvisR[i] = math.random(0, 255)
		fifty.colorInvisG[i] = math.random(0, 255)
		fifty.colorInvisB[i] = math.random(0, 255)
		
		fifty.colorVisibR[i] = math.random(0, 255)
		fifty.colorVisibG[i] = math.random(0, 255)
		fifty.colorVisibB[i] = math.random(0, 255)
		
		fifty.zoomFifty[i] = math.random(-400, 300)
	end
end
		
function fifty.draw()
	for i = 0, 49 do
		obj.init(fifty.x[i], fifty.y[i], 0,
				 fifty.width + fifty.zoomFifty[i], fifty.height + fifty.zoomFifty[i], 
				 fifty.length + fifty.zoomFifty[i],
				 fifty.colorInvisR[i], fifty.colorInvisG[i], fifty.colorInvisB[i],
				 fifty.colorVisibR[i], fifty.colorVisibG[i], fifty.colorVisibB[i]
				)
		obj.draw()
		love.graphics.setColor(0, 255, 0)
		love.graphics.print("x "..fifty.x[i].." y "..fifty.y[i],
							--.." RGB "..fifty.colorInvisR[i].." "..fifty.colorInvisG[i]
							--.." "..fifty.colorInvisB[i].." Z"..fifty.zoomFifty[i], 
							20, 10*i)
		love.graphics.setColor(255, 255, 255)
	end
end