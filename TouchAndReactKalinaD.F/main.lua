-----------------------------------------------------------------------------------------
-- Title: TouchAndReact
-- Name: Kalina Dunne Farrell
-- Course: ICS2O
-- This program does something when I click on the button
-----------------------------------------------------------------------------------------
-- set the backgound color
display.setDefault("background", 0, 1, 0)

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- create blueButton, set its position and make it visible
local blueButton = display.newImageRect("Images/blueButton.png", 200, 200)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true

-- create redButton, set its position and make it invisible
local redButton = display.newImageRect("Images/redButton.png", 200, 200)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

-- create textObject, set its position and make it invisible
local textObject = display.newText("Clicked!", 0, 0, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor(0, 0, 0)
textObject.isVisible = false

-- Function: BlueButtonListener
-- Input: touch listener
-- Output: none
-- Description: when blueButton is clicked, it will make the text appear with the red 
-- button, and make the blue button disappear
local function BlueButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
	end

	if (touch.phase == "ended") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
	end
end

-- add the respective listeners to each object
blueButton:addEventListener("touch", BlueButtonListener)