-----------------------------------------------------------------------------------------
-- Title: MovingObjects
-- Name: Kalina Dunne Farrell
-- Course: ICS2O/3C
-- This program moves a beetleship across the screen and then makes it fade out.
-- I added another object that moves in a different direction as well as a background
-- image
-----------------------------------------------------------------------------------------
-- setup

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- global variable
scrollSpeed = 3

-- background image with width and height
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
-----------------------------------------------------------------------------------------
-- sounds

-- make the beetleship sound
local beetleshipSound = audio.loadStream("Sounds/beeps.mp3")

-- make the star sound
local starSound = audio.loadStream("Sounds/blip.mp3")
-----------------------------------------------------------------------------------------
-- chracter #1 (beetleship)

-- character image with width and height
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

-- set the image to be transparent
beetleship.alpha = 0

-- set the initial x and y position of beetleship
beetleship.x = 0
beetleship.y = display.contentHeight/3

-- set the original size of beetleship
beetleship.xScale = 1
beetleship.yScale = 1
-- Function: MoveShip
-- Input: this funcion accepts an event listner
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the ship
local function MoveShip(event)
	
	-- add the scroll speed to the x-value of the ship
	beetleship.x = beetleship.x + scrollSpeed
	-- change the transparency of the ship everytime it moves so that it fades in
	beetleship.alpha = beetleship.alpha + 0.007
	-- make it so that beetleship shrinks every time it moves
	beetleship.xScale = beetleship.xScale - 0.001
	beetleship.yScale = beetleship.yScale - 0.001

end

-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)

-- play a sound effect
audio.play(beetleshipSound)
-----------------------------------------------------------------------------------------
-- character #2 (star)

-- make a different scrollSpeed
scrollSpeedStar = 5

-- character image with width and height
local star = display.newImageRect("Images/star.png", 200, 200)

-- set the transparancy of star
star.alpha = 1

-- set the initial x and y position of star
star.x = 1028
star.y = display.contentHeight/1.5

-- set the original size of star
star.xScale = 1
star.yScale = 1

-- Function: MoveStar
-- Input: this funtion accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the value of the ship
local function MoveStar(event)
	
	-- add the scroll speed to the x-value of star
	star.x = star.x - scrollSpeedStar
	-- change the transparency of the ship everytime it moves so that it fades out
	star.alpha = star.alpha - 0.002
	-- make it so that star grows everytime it moves
	star.xScale = star.xScale + 0.005
	star.yScale = star.yScale + 0.005
	
end

-- make star rotate/spin
transition.to(star, {x=-250, rotation = star.rotation-900,time=2000,} )

-- MoveStar will be called over and over again
Runtime:addEventListener("enterFrame", MoveStar)

-- play the sound effect
audio.play(starSound)