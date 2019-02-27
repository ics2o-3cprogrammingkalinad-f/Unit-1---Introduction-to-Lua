-----------------------------------------------------------------------------------------
-- Title: TouchAndDrag\
-- Name: Kalina Dunne Farrell
-- Course: ICS20
-- This program...
-----------------------------------------------------------------------------------------
-- girl:
-- girlOne for me is yellowGirl 
-- girlTwo for me is blueGirl
-----------------------------------------------------------------------------------------
-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- create the local variables
local backgroundImage = display.newImageRect("Images/background.png", 2045, 1536)
local girlOne = display.newImageRect("Images/girl1.png", 150, 150)
local girlOneWidth = girlOne.width
local girlOneHeight = girlOne.height

local girlTwo = display.newImageRect("Images/girl2.png", 150, 150)
local girlTwoWidth = girlTwo.width
local girlTwoHeight = girlTwo.height

local planet = display.newImageRect("Images/planet.png", 150, 150)
local planetWidth = planet.width
local planetHeight = planet.height

-- create the boolean variables to keep track of which object I touched first
local alreadyTouchedGirlOne = false
local alreadyTouchedGirlTwo = false
local alreadyTouchedPlanet = false

-- set the initial (x,y) positions of the characters
girlOne.x = 400
girlOne.y = 500

girlTwo.x = 300
girlTwo.y = 200

planet.x = 620
planet.y = 400

-- Function: girlOneListener
-- Input: touch listener
-- Output: none
-- Desciption: when girlOne is touched, move her
local function girlOneListener(touch)
	
	if (touch.phase == "began") then
		if (alreadyTouchedGirlTwo == false) then
			if (alreadyTouchedPlanet == false) then
			alreadyTouchedGirlOne = true
			end
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedGirlOne == true) ) then
		girlOne.x = touch.x
		girlOne.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedGirlOne = false
		alreadyTouchedGirlTwo = false
		alreadyTouchedPlanet = false
	end
end

-- add the listener for girlOne
girlOne:addEventListener("touch", girlOneListener)

-- Function: girlTwoListener
-- Input: touch listener
-- Output: none
-- Desciption: when girlTwo is touched, move her
local function girlTwoListener(touch)
	
	if (touch.phase == "began") then
		if (alreadyTouchedGirlOne == false) then
			if (alreadyTouchedPlanet == false) then
			alreadyTouchedGirlTwo = true
			end
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedGirlTwo == true) ) then
		girlTwo.x = touch.x
		girlTwo.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedGirlTwo = false
		alreadyTouchedGirlOne = false
		alreadyTouchedPlanet = false
	end
end

-- add the listener for girlTwo
girlTwo:addEventListener("touch", girlTwoListener)

-- Function: PlanetListener
-- Input: touch listener
-- Output: none
-- Desciption: when planet is touched, move it
local function planetListener(touch)
	
	if (touch.phase == "began") then
		if (alreadyTouchedGirlOne == false) then
			if (alreadyTouchedGirlTwo == false) then
			alreadyTouchedPlanet = true
			end
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedPlanet == true) ) then
		planet.x = touch.x
		planet.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedGirlTwo = false
		alreadyTouchedGirlOne = false
		alreadyTouchedPlanet = false
	end
end

-- add the listener for planet
planet:addEventListener("touch", planetListener)