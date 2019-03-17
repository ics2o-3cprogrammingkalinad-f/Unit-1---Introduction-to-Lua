-----------------------------------------------------------------------------------------
-- Title: PhysicsAndCollisions
-- Name: Kalina Dunne Farrell
-- Course: ICS2O
-- This program displays balls that will roll down a ramp/hill and bounce off the ground
-- and collide with each other.
-----------------------------------------------------------------------------------------
-- setup

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- load physics
local physics = require("physics")

-- start physics
physics.start()
-----------------------------------------------------------------------------------------
-- objects

-- ground
local ground = display.newImage("Images/ground.png", 0, 0)

	-- set its x and y values
	ground.x = display.contentWidth/2
	ground.y = display.contentHeight

	-- change the width of ground to e the same as the screen width
	ground.width = display.contentWidth

	-- add to physics
	physics.addBody(ground, "static", {friction=0.5, bounce=0.3})
	------------------------------
-- beam
local beam = display.newImage("Images/beam.png", 0, 0)

	-- set its x and y values
	beam.x = display.contentCenterX/5
	beam.y = display.contentCenterY*1.65

	-- set the beam width to be half of the screen width and the height to be 1/10th of 
	--the iPad height
	beam.width = display.contentWidth/2
	beam.height = display.contentHeight/10

	-- rotate the beam -60 degrees so its on an angle
	beam:rotate(45)

	-- send it to the back layer
	beam:toBack()

	-- add to physics
	physics.addBody(beam, "static", {friction=0.5, bounce=0.3})
------------------------------
-- wall
local wall = display.newImage("Images/beam.png", 0, 0)

 	-- set its x and y values
 	wall.x = display.contentWidth
 	wall.y = display.contentCenterY

 	-- set its height to be the height of the screen
 	wall.height = display.contentHeight

 	-- send it to the back
 	wall:toBack()
 ------------------------------
-- create backround
local bkg = display.newImage("Images/bkg.png", 0, 0)

	-- set the x and y values
	bkg.x = display.contentCenterX
	bkg.y = display.contentCenterY

	-- set the width of the bkg image to be the width of the screen and the height to be 
	--the height of the screen
	bkg.width = display.contentWidth
	bkg.height = display.contentHeight

	-- send to back layer
	bkg:toBack()

	-- add to physics
	physics.addBody(wall, "static", {friction=0.5, bounce=0.3})
-----------------------------------------------------------------------------------------
-- functions

-- create the first ball
local function firstBall()

	-- creating first ball
	local ball1 = display.newImage("Images/ball.png", 0, 0)

	-- add to physics
	physics.addBody(ball1, {density=3.0, friction=0.5, bounce=0.9, radius=25})

end
------------------------------
-- create the second ball 
local function secondBall()

	-- creating second ball
	local ball2 = display.newImage("Images/ball.png", 0, 0)

	-- scale ball2 to be half its original size
	ball2:scale(0.5, 0.5)

	-- add to physics
	physics.addBody(ball2, {density=1.0, friction=0.5, bounce=0.5, radius=12.5})

end
------------------------------
-- create the third ball
local function thirdBall()

	-- creating third ball
	local ball3 = display.newImage("Images/ball.png", 0, 0)

	-- scale ball3 to 4 times its original size
	ball3:scale(4, 4)

	-- add to physics
	physics.addBody(ball3, {density=3.0, friction=0.5, bounce=0.1, radius=100})

end
------------------------------
-- create the fourth ball
local function fourthball()

	-- creating fourth ball
	local ball4 = display.newImage("Images/ball.png", 0, 0)

	-- add to physics
	physics.addBody(ball4, {density=0.1, friction=0.1, bounce=0.5, radius=25})

end
------------------------------
-- make the bkg music
local function bkgMusic()

	-- create the bkg music
	local bkgMusic = audio.loadStream("Sounds/bkgMusic.mp3")

	-- play the bkg music
	audio.play(bkgMusic)

end
----------------------------------------------------------------------------------------
-- timer delays - call each function after the given milliseconds
timer.performWithDelay(0, firstBall)
timer.performWithDelay(0, bkgMusic)
timer.performWithDelay(50, secondBall)
timer.performWithDelay(100, thirdBall)
timer.performWithDelay(150, fourthball)