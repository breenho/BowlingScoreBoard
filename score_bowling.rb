require "./input_split.rb"
# New class ScoreBowling creation by inhering the InputSplit class, which has the resultant array 
# of the input string
class ScoreBowling < InputSplit
	# Method calculate will get the sample input string from the user and it will pass it to form_input_array() 
	# method in InputSplit class to get the 2D array of the input string
	def calculate(input_val)
		if input_val == "xxxxxxxxxxxx" # No need to process the string if we know min and max values, so that we can save process time. But still if you pass these values to the method, it will produce the same result.
			"Congratulations!! Your score is 300"
		elsif input_val == "00000000000000000000"
			"Sorry!! Your score is 0"
		else
			validated = !input_val.match?(/[^x\/0-9]/) # String validation - this will allow only "x or / or 0 to 9"
			input_obj = InputSplit.new # New object creation for InputSplit class
			input = validated ? input_obj.form_input_array(input_val) : "" #if it is a correct string, it will be passed to produce the 2D array, else and empty string.
			if !input.empty? && !input.kind_of?(String) # The result will be an array
				final_total = 0 #given initial value as 0 to the overall score, need to sum as the logic goes inside
				input.each_with_index do |frame_score,index| #looping through the array of arrays, that is the uncalculated frame score in an array format
					if is_value?(index) # goes in only if the array length is less than 10 (that is 10 frames)
						frame_total = 0 # initial frame total value
						if frame_score[0] == 10 # Goes inside the block only if the score of first try of the frame is strike
							frame_total += 10 #adds to the current frame total
							if input[index+1][0] == 10 #if it was a strike, then have to move to next frame. Here, checking the first try is also a strike
								frame_total += input[index+1][0] #adds to the current frame total
								if input[index+1][1] != 10 #if the second try's value of a frame is not a strike, then adding it to the frame_total
									frame_total += input[index+2][0].to_i
								else #if it was a strike, then adding next successive frame's first try value.
									frame_total += input[index+1][1].to_i
								end
							else # If it was a spare, then we are checking if the next frame's first try value and add it's respective values.
								frame_total += input[index+1][0].to_i
								if is_spare?(input[index+1][1])
									frame_total += (10-input[index+1][0].to_i)
								else
									frame_total += input[index+1][1].to_i
								end
							end
						elsif is_value?(frame_score[0])  # Goes inside the block only if the score of the frame is less than 10 
							frame_total += frame_score[0].to_i # add the current frame total values
							if is_spare?(frame_score[1]) # if the second try is a spare, then it will add the next successive value
								frame_total += (10-frame_score[0].to_i)
								if index != 10 #this will execute only if the last frame values are either strike or spare
									frame_total += input[index+1][0].to_i
								end
							else
								frame_total += frame_score[1].to_i
							end
						elsif is_value?(frame_score[0]) & is_value?(frame_score[1]) # If it was neither strike nor spare, then the two values of the current frame will be added to each other
							frame_total += frame_score[0].to_i + frame_score[1].to_i
						end
						p "Frame #{index+1} score is : #{frame_total}" # Here is the display of each frame scores

						final_total += frame_total.to_i
					end
				end
				p "Overall score is : #{final_total}" # Here is the display of overall scores
			else # if the input contains an empty or a string type, need to show error
				p "Error in input string"
			end
		end
	end
end

# Here I am leaving the below examples to test in console
%w(xxxxxxxxxxxx 00000000000000000000 90909090909090909090 5/5/5/5/5/5/5/5/5/5/5 14456/5/00017/6/002/6 
9/356136815325807181 903/613/815/0/807/80 x3/61xxx2/907/xxx).each do |input_value|
	score_bowling = ScoreBowling.new
	score_bowling.calculate(input_value)
end