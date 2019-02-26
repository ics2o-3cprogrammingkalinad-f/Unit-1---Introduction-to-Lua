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

-- status bar command is not working

-- global variable
scrollSpeed = 3

-- background image with width and height
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
-----------------------------------------------------------------------------------------
-- chracter #1 (beetleship)

-- character image with width and height
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

-- set the image to be transparent
beetleship.alpha = 0

-- set the initial x and y position of beetleship
beetleship.x = 0
beetleship.y = display.contentHeight/3

-- Function: MoveShip
-- Input: this funcion accepts an event listner
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the ship
local function MoveShip(event)
	-- add the scroll speed to the x-value of the ship
	beetleship.x = beetleship.x + scrollSpeed
	-- change the tansparency of the ship everytime it moves so that it fades in
	beetleship.alpha = beetleship.alpha + 0.01
end

-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)
-----------------------------------------------------------------------------------------
-- character #2 (star)

-- make a different scrollSpeed
scrollSpeed = 5

-- character image with width and height
local star = display.newImageRect("Images/star.png", 200, 200)

-- set the transparancy of star
star.alpha = 1

-- set the initial x and y position of star
star.x = 1028
star.y = display.contentHeight/1.5

-- Function: MoveStar
-- Input: this funtion accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the value of the ship
local function MoveStar(event)
	-- add the scill sped to the x-value of star
	star.x = star.x - scrollSpeed
	-- change the transparency of the shipe everytime it moves so that it fades out
	star.alpha = star.alpha - 0.01
end

-- MoveStar will be called over and over again
Runtime:addEventListener("enterFrame", MoveStar)