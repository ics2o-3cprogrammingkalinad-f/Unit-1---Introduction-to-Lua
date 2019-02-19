--Title: HelloWorld
--Name: Kalina
--Course: ICS20/3C
-- This program displays Hello to the iPad simulator and "Hello to the command terminal"
-------------------------------------------------------------------------------------------

-- print "Hello, World!" to the command terminal
print ("Hello! Hello! Hello!")

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the background color
display.setDefault("background", 51/255, 255/255, 255/255)

-- create a local variable
local textObject

--displays text on the screen at position x = 500 and y = 500
-- a default font style and font size of 50
textObject = display.newText("Hello, World!!!!", 512, 300, nil, 100)

-- sets the color of the text
textObject:setTextColor(0/255, 0/255, 0/255)

-- create a variable for who it's by
local textObjectSignature

-- place and size the "by" variable
textObjectSignature = display.newText("Created by: Kalina D.F.", 512, 500, nil, 70)

-- set the color of the "by" variable text
textObjectSignature:setTextColor(0255255, 255/255, 255/255)

-- print to the command terminal
print ("This is awesome!!!")


----------------------------------------------------------------------------------
-- random things 

-- make a line variable
local line

-- make it into a line
line = display.newText("______________", 512, 320, nil, 100)

-- turn it black