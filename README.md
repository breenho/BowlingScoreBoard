# BowlingScoreBoard
	Automatic score board for bowling game in Ruby

# The Game
	On competitions there are 10 frames. In each frame the player has the opportunity to
	try to take down the pins twice and there are 10 pins on the start of each try.

# The Rules
	- If the player knocks down less than 10 pins during 2 tries on the same frame, 
	his/her score is the sum of the pins they’ve knock down in the 2 attempts.
	
	- If the player knocks down all the 10 pins during 2 tries on the same frame(spare), 
	his/her score is the sum of the pins knocked down on the spare (10), plus the number 
	of pins knocked down in the next try.
	Example: try 1(spare): 3|7, try 2: 3|4, score try 1: 13, score try 2: 7, total: 20
	
	- If the player knocks down all 10 pins on the first try (strike), his/her score is
	the sum of pins knocked down on the strike (10) plus the number of pins	knocked down 
	on the next 2 tries.
	Example: try 1(strike): 10|/, try 2: 3|4, score try 1: 17, score try 2: 7, total: 24

# My Approach
	I get the final input string from the judges (i.e, input in our code), which is the 
	score value for each throw (this includes bonus throws for strikes and spares). Then, 
	I process the input string to produce an array of arrays in 'form_input_array()' method 
	from InputSplit class.
	
	Once I get the resultant 2D array from the above step, I will then pass it to the 
	'calculate()' method in ScoreBowling class to get the scores for each frame as well as 
	the overall score of the game based on the rules.

# Limitations
	- Need to add more examples for failing specs
	- Need to optimize and refactor the code

# Examples
	1) Input String = "xxxxxxxxxxxx"
	Output : "Congratulations!! Your score is 300"

	2) Input String = "00000000000000000000"
	Output : "Sorry!! Your score is 0"

	3) Input String = "00000000000000000000"
	Splitted Array = [["9", "0"], ["9", "0"], ["9", "0"], ["9", "0"], ["9", "0"], ["9", "0"],
	["9", "0"], ["9", "0"], ["9", "0"], ["9", "0"]]
	Output:
	"Frame 1 score is : 9"
	"Frame 2 score is : 9"
	"Frame 3 score is : 9"
	"Frame 4 score is : 9"
	"Frame 5 score is : 9"
	"Frame 6 score is : 9"
	"Frame 7 score is : 9"
	"Frame 8 score is : 9"
	"Frame 9 score is : 9"
	"Frame 10 score is : 9"
	"Overall score is : 90"

	4) Input String = "00000000000000000000"
	Splitted Array = [["5", "/"], ["5", "/"], ["5", "/"], ["5", "/"], ["5", "/"], ["5", "/"],
	["5", "/"], ["5", "/"], ["5", "/"], ["5", "/"], ["5", 0]]
	Output:
	"Frame 1 score is : 15"
	"Frame 2 score is : 15"
	"Frame 3 score is : 15"
	"Frame 4 score is : 15"
	"Frame 5 score is : 15"
	"Frame 6 score is : 15"
	"Frame 7 score is : 15"
	"Frame 8 score is : 15"
	"Frame 9 score is : 15"
	"Frame 10 score is : 15"
	"Overall score is : 150"

	5) Input String = "00000000000000000000"
	Splitted Array = [["1", "4"], ["4", "5"], ["6", "/"], ["5", "/"], ["0", "0"], ["0", "1"],
	["7", "/"], ["6", "/"], ["0", "0"], ["2", "/"], ["6", 0]]
	Output:
	"Frame 1 score is : 5"
	"Frame 2 score is : 9"
	"Frame 3 score is : 15"
	"Frame 4 score is : 10"
	"Frame 5 score is : 0"
	"Frame 6 score is : 1"
	"Frame 7 score is : 16"
	"Frame 8 score is : 10"
	"Frame 9 score is : 0"
	"Frame 10 score is : 16"
	"Overall score is : 82"

	6) Input String = "00000000000000000000"
	Splitted Array = [["9", "/"], ["3", "5"], ["6", "1"], ["3", "6"], ["8", "1"], ["5", "3"],
	["2", "5"], ["8", "0"], ["7", "1"], ["8", "1"]]
	Output:
	"Frame 1 score is : 13"
	"Frame 2 score is : 8"
	"Frame 3 score is : 7"
	"Frame 4 score is : 9"
	"Frame 5 score is : 9"
	"Frame 6 score is : 8"
	"Frame 7 score is : 7"
	"Frame 8 score is : 8"
	"Frame 9 score is : 8"
	"Frame 10 score is : 9"
	"Overall score is : 86"

	7) Input String = "00000000000000000000"
	Splitted Array = [["9", "0"], ["3", "/"], ["6", "1"], ["3", "/"], ["8", "1"], ["5", "/"],
	["0", "/"], ["8", "0"], ["7", "/"], ["8", "0"]]
	Output:
	"Frame 1 score is : 9"
	"Frame 2 score is : 16"
	"Frame 3 score is : 7"
	"Frame 4 score is : 18"
	"Frame 5 score is : 9"
	"Frame 6 score is : 10"
	"Frame 7 score is : 18"
	"Frame 8 score is : 8"
	"Frame 9 score is : 18"
	"Frame 10 score is : 8"
	"Overall score is : 121"

	8) Input String = "00000000000000000000"
	Splitted Array = [[10, 0], ["3", "/"], ["6", "1"], [10, 0], [10, 0], [10, 0], ["2", "/"],
	["9", "0"], ["7", "/"], [10, 0], [10, 10]]
	Output:
	"Frame 1 score is : 20"
	"Frame 2 score is : 16"
	"Frame 3 score is : 7"
	"Frame 4 score is : 30"
	"Frame 5 score is : 22"
	"Frame 6 score is : 20"
	"Frame 7 score is : 19"
	"Frame 8 score is : 9"
	"Frame 9 score is : 20"
	"Frame 10 score is : 30"
	"Overall score is : 193"

# Author
	Breen - https://github.com/breenho

# Contribution
	Please contribute to this repo to optimize the code.
