-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
-- Title: LivesAndTimers
-- Name: Kalina Dunne Farrell
-- Course: ICS2O
-- This program...
-----------------------------------------------------------------------------------------
-- setup

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the background color
display.setDefault("background", 153/255, 1, 1)
-----------------------------------------------------------------------------------------
-- local variables

-- variables for the question
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

-- variables for the timer
local totalSeconds = 16
local secondsLeft = 15
local clockText 
local countDownTimer

local youLose
local youLoseSound

-- variables for the lives
local lives = 4
local heart1
local heart2
local heart3
local heart4
-----------------------------------------------------------------------------------------
-- local functions

local function AskQuestion()

	-- generate two random numbers between a max. and a min. number
	randomNumber1 = math.random(10, 20)
	randomNumber2 = math.random(10, 20)

	-- re-set operation to another random number
	operation = math.random(1, 4)

	if (operation == 1) then
	
	correctAnswer = randomNumber1 + randomNumber2

	-- create question in text object
	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	elseif (operation == 2) then
		
		if (randomNumber2 > randomNumber1) then
			AskQuestion()

		else
		correctAnswer = randomNumber1 - randomNumber2

		-- create question in text object
		questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "
		end

	elseif (operation == 3) then

		correctAnswer = randomNumber1 * randomNumber2

		-- create question in text object
		questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = "

	else

		correctAnswer = randomNumber1 / randomNumber2
		math.round(correctAnswer)

		-- create question in text object
		questionObject.text = randomNumber1 .." / ".. randomNumber2 .." = "

	end
end	

local function IncreasePointCount()
	-- create question in text object
	question = question + 1
	questionCount.text = "You have answered ".. question .." questions correctly"

end	

local function UpdateLives()

	-- make the hearts become invisible
	if (lives == 3) then
		heart4.isVisible = false
	elseif (lives == 2) then
		heart3.isVisible = false
	elseif (lives == 1) then
		heart2.isVisible = false
	elseif (lives == 0) then
		heart1.isVisible = false
		-- stop the timer
		timer.cancel(countDownTimer)
		questionObject.isVisible = false
		numericField.isVisible = false

		youLose.isVisible = true

	end
end

local function HideCorrect()
	-- hide the correct object
	correctObject.isVisible = false
	-- hide the value in the answer box
	numericField.text = ""
	-- call function
	AskQuestion()
	-- resume timer
	timer.resume(countDownTimer)

end

local function HideIncorrect()
	-- hide the incorrect object
	incorrectObject.isVisible = false
	-- hide the value in the answer box
	numericField.text = ""
	-- lose a life
	lives = lives - 1
	-- call functions
	AskQuestion()
	UpdateLives()
	-- resume timer
	timer.resume(countDownTimer)

end

-- update the timer function
local function UpdateTime()

	-- decrease the number of seconds
	secondsLeft = secondsLeft - 1

	-- display the number of left in the clock object
	clockText.text = secondsLeft ..""

	if (secondsLeft == 0) then

		-- reset the number of seconds left
		secondsLeft = totalSeconds
		lives = lives - 1
		UpdateLives()

	end
end

-- create the timer function 
local function StartTimer()

	-- create a countdown timer that loops infinitly
	countDownTimer = timer.performWithDelay(1000, UpdateTime, 0)

end

local function NumericFieldListener(event)

	-- user begins editing "numericField"
	if (event.phase == "began") then

		-- clear text field
		event.target.text = ""

	elseif event.phase == "submitted" then

		-- when the answer is submitted (enter key is pressed), set user input to userAnswer
		userAnswer = tonumber(event.target.text)
		secondsLeft = totalSeconds
		timer.pause(countDownTimer)

		-- if the users answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			incorrectObject.isVisible = false
			IncreasePointCount()
			timer.performWithDelay(2000, HideCorrect)

		else
			correctObject.isVisible = false
			incorrectObject.isVisible = true
			timer.performWithDelay(2000, HideIncorrect)

		end
	end
end
-----------------------------------------------------------------------------------------
-- object creation

-- displays a question and sets its color
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, ComicSans, 70)
questionObject:setTextColor(0, 0, 0)

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
numericField.inputType = "number" 

-- add the event listener for the numeric field
numericField:addEventListener("userInput", NumericFieldListener)

-- display questionCount and set its color
questionCount = display.newText( "You have answered ".. question .." questions correctly", display.contentWidth/2, 720, nil, 50)
questionCount:setTextColor(0, 0, 0)

-- create the lives (hearts) to display on the screen
heart1 = display.newImageRect("Images/heart1.png", 100, 100)
heart1.x = 50
heart1.y = 45

heart2 = display.newImageRect("Images/heart2.png", 100, 100)
heart2.x = 150
heart2.y = 45

heart3 = display.newImageRect("Images/heart3.png", 100, 100)
heart3.x = 250
heart3.y = 45

heart4 = display.newImageRect("Images/heart4.png", 100, 100)
heart4.x = 350
heart4.y = 45

-- display the timer
clockText = display.newText(secondsLeft, 950, 45, nil, 70)
clockText:setTextColor(0, 0, 0)

-- create the losing image and make it invisible
youLose = display.newImageRect("Images/youLose.png", 500, 500)
youLose.x = display.contentWidth/2
youLose.y = display.contentHeight/2
youLose.isVisible = false
-----------------------------------------------------------------------------------------
-- function calls

-- call the function to ask the question
AskQuestion()

-- call the function to re-start the timer
StartTimer()