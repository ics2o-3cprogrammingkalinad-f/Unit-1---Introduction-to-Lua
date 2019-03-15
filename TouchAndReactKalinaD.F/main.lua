-----------------------------------------------------------------------------------------
-- Title: TouchAndReact
-- Name: Kalina Dunne Farrell
-- Course: ICS2O
-- This program does something when I click on the button
-----------------------------------------------------------------------------------------
-- set the background color
display.setDefault("background", 122/255, 213/255, 234/255)

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
textObject:setTextColor(1, 1, 1)
textObject.isVisible = false

-- create textObjectSignature, set its position and color
local textObjectSignature = display.newText("By: Kalina D.F.", 0, 0, nil, 50)
textObjectSignature.x = 170
textObjectSignature.y = 35
textObjectSignature:setTextColor (0, 0, 0)

-- create lightImage, set  its position and make it invisible
local lightImage = display.newImageRect("Images/lightBeam.png", 200, 200)
lightImage.x = 920
lightImage.y = 100
lightImage.isVisible = false

-- create cartoonPop
local cartoonPop = audio.loadStream("Sounds/cartoonPop.mp3")

-- Function: BlueButtonListener
-- Input: touch listener
-- Output: none
-- Description: when blueButton is clicked, it will make redButton, textObject
-- and lightImage appear, change the color of textObjectSignature and the background
local function BlueButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
		lightImage.isVisible = true
		textObjectSignature:setTextColor(1, 1, 1)
		display.setDefault("background", 0, 0, 0)
		audio.play(cartoonPop)
	end
end

local function RedButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
		lightImage.isVisible = false
		textObjectSignature:setTextColor(0, 0, 0)
		display.setDefault("background", 122/255, 213/255, 234/255)
	end
end

-- add the respective listeners to each object
blueButton:addEventListener("touch", BlueButtonListener)
redButton:addEventListener("touch", RedButtonListener)