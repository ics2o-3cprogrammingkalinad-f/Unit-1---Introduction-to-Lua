-----------------------------------------------------------------------------------------
-- Title: WhackAMole
-- Name: Kalina Dunne Farrell
-- Course: ICS2O
-- This program places a random object on the screen. If the user clicks on it in time,
-- the score increases by 1.
-----------------------------------------------------------------------------------------
-- setup

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- creating background
local bkg = display.newRect(0, 0, display.contentWidth, display.contentHeight)
	
	-- set the color of the background
	bkg:setFillColor(204/255, 1, 1)

	-- set its position
	bkg.anchorX = 0
	bkg.anchorY = 0
	bkg.x = 0
	bkg.y = 0
-----------------------------------------------------------------------------------------
-- objects

-- creating mole
local mole = display.newImage("Images/walnut.png", 0, 0)

	-- set its position
	mole.x = display.contentCenterX
	mole.y = display.contentCenterY

	-- scale down to two thirds of its original size
	mole:scale(0.6, 0.6)

	-- make mole invisible
	mole.isVisible = false

-- make a local variable to keep track of the score
local scoreCount = 0
-- make a local variable to display the score
local scoreText = display.newText("Score: " .. scoreCount, 0, 0, nil, 50)

	-- set its x and y positions
	scoreText.x = 100
	scoreText.y = 30

	-- set its color
	scoreText:setTextColor(0, 0, 153/255)

-- create the sound effect for when mole is Whacked
local bonk = audio.loadStream("Sounds/bonk.mp3")

-- create the background music
local bkgMusic = audio.loadStream("Sounds/bkgMusic.mp3")
-----------------------------------------------------------------------------------------
-- functions

-- this function makes the mole appear in a random (x, y) position on the screen then 
-- calls the hide function
function PopUp()

	-- chosing a random position on the screen between 0 and the size of the screen
	mole.x = math.random(0, display.contentWidth)
	mole.y = math.random(0, display.contentHeight)

	-- make the mole visible
	mole.isVisible = true

	-- call the hide function after 1 second
	timer.performWithDelay(1000, Hide)

end

-- this function calls the popUpfunction after 3 seconds
function PopUpDelay()

	timer.performWithDelay(3000, PopUp)

end

-- this function makes the mole visible and then calls the PopUpDelay function
function Hide()

	-- changing visibility
	mole.isVisible = false

	-- call the PopUpDelay function
	PopUpDelay()

end

-- this function starts the game
function GameStart()

	PopUpDelay()

	-- start the background music
	audio.play(bkgMusic)

end

-- this function increases the score only if the mole is clicked. then it 
-- displays the new score
function Whacked(event)

	-- if touch phase just started
	if (event.phase == "began") then
		scoreCount = scoreCount + 1
		scoreText.text = "Score: " .. scoreCount
		audio.play(bonk)

	end
end
-----------------------------------------------------------------------------------------
-- event listeners

-- I add the event listener to the mole so that if the mole is touched, the Whacked function
-- is called
mole:addEventListener("touch", Whacked)
-----------------------------------------------------------------------------------------
-- start the game
GameStart()