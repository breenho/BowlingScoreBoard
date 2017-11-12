# BowlingScoreBoard
	Automatic score board for bowling game in Ruby

# The Game
	On competitions there are 10 frames. In each frame the player has the opportunity to try to take down the pins twice and there are 10 pins on the start of each try.

# The Rules:
	- If the player knocks down less than 10 pins during 2 tries on the same frame, his/her score is the sum of the pins they’ve knock down in the 2 attempts.
	- If the player knocks down all the 10 pins during 2 tries on the same frame(spare), his/her score is the sum of the pins knocked down on the spare (10), plus the number of pins knocked down in the next try.
	Example: try 1(spare): 3|7, try 2: 3|4, score try 1: 13, score try 2: 7, total: 20
	- If the player knocks down all 10 pins on the first try (strike), his/her score is
	the sum of pins knocked down on the strike (10) plus the number of pins
	knocked down on the next 2 tries.
	Example: try 1(strike): 10|/, try 2: 3|4, score try 1: 17, score try 2: 7, total: 24

# My Approach:
	I get the final input string from the judges (i.e, input in our code), which is the score value for each throw (this includes bonus throws for strikes and spares). Then I process the input string to produce an array of arrays in 'form_input_array()' method from InputSplit class.
	Once I get the resultant 2D array from the above step, I will then pass it to the 'calculate()' method in ScoreBowling class to get the scores for each frame as well as the overall score of the game based on the