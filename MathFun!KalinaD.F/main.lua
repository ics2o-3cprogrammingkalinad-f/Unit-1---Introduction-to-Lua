-----------------------------------------------------------------------------------------
-- Title: MathFun!
-- Name: Kalina Dunne Farrell
-- Course: ICS2O
-- This program displays a math question and asks the user to answer in a numeric 
-- textfield terminal. If the timer runs out, you lose a life. If you get the question
-- wrong, you lose a life.
-----------------------------------------------------------------------------------------
-- setup

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the background color
display.setDefault("background", 0, 0, 0)
-----------------------------------------------------------------------------------------
-- local variables

local questionObject
local correctObject
local incorrectObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local questionCount
local question = 0
local operation = math.random(1, 3)
-----------------------------------------------------------------------------------------
-- sounds

-- correct sound
local correctSound = audio.loadStream("Sounds/clapping.mp3")

-- incorrect sound
local incorrectSound = audio.loadStream("Sounds/beep.mp3")
-----------------------------------------------------------------------------------------
-- local functions

local function AskQuestion()
	-- generate two random numbers between a max. and a min. number and repeat until 
	--randomNumber1 is greater than randomNumber2
	repeat
	randomNumber1 = math.random(10, 20)
	randomNumber2 = math.random(10, 20)
	until (randomNumber1 >= randomNumber2)
	while (randomNumber1 < randomNumber2)

	-- re-set operation to another random number
	operation = math.random(1, 4)

	if (operation == 1) then
	
	correctAnswer = randomNumber1 + randomNumber2

	-- create question in text object
	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	elseif (operation == 2) then

		-- create question in text object
		questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "

	elseif (operation == 3) then

		correctAnswer = randomNumber1 * randomNumber2

		-- create question in text object
		questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = "

	else

		correctAnswer = randomNumber1 / randomNumber2 * 100 
		math.round(correctAnswer)
		correctAnswer = correctAnswer / 100

		-- create question in text object
		questionObject.text = randomNumber1 .." / ".. randomNumber2 .." = "

	end
end	

local function IncreasePointCount()
	-- create question in text object
	question = question + 1
	questionCount.text = "You have answered ".. question .." questions correctly"

end	

local function HideCorrect()
	-- hide the correct object
	correctObject.isVisible = false
	-- hide the value in the answer box
	numericField.text = ""
	-- ask another queston 
	AskQuestion()
end

local function NumericFieldListener(event)

	-- user begins editing "numericField"
	if (event.phase == "began") then

		-- clear text field
		event.target.text = ""

	elseif event.phase == "submitted" then

		-- when the answer is submitted (enter key is pressed), set user input to userAnswer
		userAnswer = tonumber(event.target.text)

		-- if the users answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			incorrectObject.isVisible = false
			IncreasePointCount()
			timer.performWithDelay(2000, HideCorrect)
			audio.play(correctSound)

		else
			correctObject.isVisible = false
			incorrectObject.isVisible = true
			audio.play(incorrectSound)

		end
	end
end
-----------------------------------------------------------------------------------------
-- object creation

-- displays a question and sets its color
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, ComicSans, 70)
questionObject:setTextColor(1, 1, 1)

-- create the correct text object and make it invisible
correctObject = display.newText("Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
correctObject:setTextColor(0, 1, 0)
correctObject.isVisible = false

-- create the incorrect text object and make it invisible
incorrectObject = display.newText("Sorry, that's incorrect", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
incorrectObject:setTextColor(1, 0, 0)
incorrectObject.isVisible = false

-- create numericField
numericField = native.newTextField(560, 380, 150, 100)
numericField.inputType = "default"

-- add the event listener for the numeric field
numericField:addEventListener("userInput", NumericFieldListener)

-- display pointCount and set its color
questionCount = display.newText( "You have answered ".. question .." questions correctly", display.contentWidth/2, 30, nil, 50)
questionCount:setTextColor(1, 1, 1)
-----------------------------------------------------------------------------------------
-- function calls

-- call the function to ask the question
AskQuestion()