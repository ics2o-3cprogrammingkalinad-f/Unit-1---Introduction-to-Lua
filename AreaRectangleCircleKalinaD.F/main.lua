-----------------------------------------------------------------------------------------
-- Title: Local Variables
-- Name: Kalina Dunne Farrell
-- Course: ICS2O
-- This program that displays a colored rectangle with a border of a different color. 
-- It also calculates the rectangle's area and displays it on the screen. Then I added 
-- the code to draw a circle of a given radius that is colored and has a border of a 
-- different color. I used the radius to calculate the area and displayed this on the iPad.
------------------------------------------------------------------------------------------
-- setup:

-- set the background color of the screen
display.setDefault("background", 0, 0, 1)

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

------------------------------------------------------------------------------------------
-- rectangle:

-- create the local variables
local areaText
local textSize = 50
local myRectangle
local widthOfRectangle = 350
local heightOfRectangle = 200
local areaOfRectangle

-- draw the rectangle that is half the width and height of the screen 
myRectangle = display.newRect(0, 0, widthOfRectangle, heightOfRectangle)

-- anchor the rectangle in the top left corner of the screen and set its (x,y) position
myRectangle.x = 180
myRectangle.y = 110

-- set the width of the border
myRectangle.strokeWidth = 20

-- set the color of the rectangle
myRectangle:setFillColor(127/255, 0, 1)

-- set the color of the border
myRectangle:setStrokeColor(0, 0, 0)

-- calculate the area
areaOfRectangle = widthOfRectangle * heightOfRectangle

-- write the area on the screen
areaText = display.newText("The area of this rectangle with a width of \n" ..
	widthOfRectangle.. " and a height of " .. heightOfRectangle .. " is " ..
	areaOfRectangle.. " pixels².", 0, 0, Arial, textSize)

-- anchor the text and set its (x,y) position
areaText.x = 500
areaText.y = display.contentHeight/2.7

-- set the color of the newText
areaText:setTextColor(1, 1, 1)

------------------------------------------------------------------------------------------
-- circle:

-- create the local variables
local areaTextCircle
local myCircle
local radiusOfCircle = 100
local areaOfCircle
local PI = 3.14

-- draw the circle on the left underneath the writing from the rectangle
myCircle = display.newCircle(0, 0, radiusOfCircle)

-- set the (x,y) of the circle
myCircle.x = 130
myCircle.y = 510

-- set the width of the border
myCircle.strokeWidth = 20

-- set the color of the circle
myCircle:setFillColor(127/255, 0, 1)

-- set the color of the border
myCircle:setStrokeColor(0, 0, 0)

-- calculate the area
areaOfCircle = radiusOfCircle * radiusOfCircle * PI

-- write the area on the screen (under the circle)
areaTextCircle = display.newText("The area of this circle with a radius of \n" ..
	radiusOfCircle.. " is " .. areaOfCircle .. " pixels².", 0, 0, Arial, textSize)

-- set the (x,y) of the newText
areaTextCircle.x = 450
areaTextCircle.y = display.contentHeight/1.13