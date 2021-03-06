x		= esp.random(1, led.width(0) - 2)
y		= esp.random(1, led.height(0) - 2)
xdir	= esp.random(5,30) / 100
ydir	= esp.random(5,30) / 100
rgb		= color.palette(2)
fade	= 0

function frame()
	x = x + xdir
	y = y + ydir

	if x >= led.width(0) then
		x		= led.width(0) - 1
		xdir	= esp.random(-30,-5) / 100
		rgb		= color.palette(esp.random(0, 0x0f))
	elseif x < 0 then
		x		= 0
		xdir	= esp.random(5, 30) / 100
		rgb		= color.palette(esp.random(0, 0x0f))
	end

	if y >= led.height(0) then
		y		= led.height(0) - 1
		ydir	= esp.random(-30,-5) / 100
		rgb		= color.palette(esp.random(0, 0x0f))
	elseif y < 0 then
		y		= 0
		ydir	= esp.random(5, 30) / 100
		rgb		= color.palette(esp.random(0, 0x0f))
	end

	fade = fade + 1
	if fade >= 5 then
		led.fade(0)
		fade = 0
	end

	led.draw(0, x, y, rgb)
end
