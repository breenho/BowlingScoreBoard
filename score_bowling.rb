require "./input_split.rb"
class ScoreBowling < InputSplit
	def calculate(input_val)

		if input_val == "xxxxxxxxxxxx"
			"Congratulations!! Your score is 300"
		elsif input_val == "00000000000000000000"
			"Sorry!! Your score is 0"
		else
			input_obj = InputSplit.new
			input = input_obj.form_input_array(input_val)
			if !input.empty? && !input.kind_of?(String)
				final_total = 0
				input.each_with_index do |frame_score,index|
					if is_value?(index)
						frame_total = 0
						if frame_score[0] == 10
							frame_total += 10
							if input[index+1][0] == 10
								frame_total += input[index+1][0]
								if input[index+1][1] != 10
									frame_total += input[index+2][0].to_i
								else
									frame_total += input[index+1][1].to_i
								end
							else # duplicate block
								frame_total += input[index+1][0].to_i
								if is_spare?(input[index+1][1])
									frame_total += (10-input[index+1][0].to_i)
								else
									frame_total += input[index+1][1].to_i
								end
							end
						elsif is_value?(frame_score[0]) # dupicate block
							frame_total += frame_score[0].to_i
							if is_spare?(frame_score[1])
								frame_total += (10-frame_score[0].to_i)
								if index != 10
									frame_total += input[index+1][0].to_i
								end
							else
								frame_total += frame_score[1].to_i
							end
						elsif is_value?(frame_score[0]) & is_value?(frame_score[1])
							frame_total += frame_score[0].to_i + frame_score[1].to_i
						end
						p "Frame #{index+1} score is : #{frame_total}"

						final_total += frame_total.to_i
					end
				end
				p "Overall score is : #{final_total}"
			else
				p input
			end
		end
	end
end

# Here I am leaving the below examples to test in console

# %w(xxxxxxxxxxxx 00000000000000000000 90909090909090909090 5/5/5/5/5/5/5/5/5/5/5 14456/5/00017/6/002/6 
# 9/356136815325807181 903/613/815/0/807/80 x3/61xxx2/907/xxx).each do |input_value|
# 	score_bowling = ScoreBowling.new
# 	score_bowling.calculate(input_value)
# end