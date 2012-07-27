-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local physics = require "physics"
physics.start(); physics.pause()

local screenW, screenH, halfW = display.contentWidth, display.contentHeight, display.contentWidth*0.5

local background = display.newRect( 0, 0, screenW, screenH )
background:setFillColor( 127, 127, 200 )

local pony = display.newImageRect( "pony.png", 100, 122 )
pony.x, pony.y = 100, -100
physics.addBody( pony, { density=1.0, bounce=0.9 } )
pony.isFixedRotation = true

local grass = display.newImageRect( "grass.png", screenW, 40 )
grass:setReferencePoint( display.BottomLeftReferencePoint )
grass.x, grass.y = 0, display.contentHeight
physics.addBody( grass, "static" )

physics.start();

-----------------------------------------------------------------------------------------
background:addEventListener('tap', function(e)
	if e.x > pony.x then
		pony:applyLinearImpulse(3, 0)
	else
		pony:applyLinearImpulse(-3, 0)
	end
end)