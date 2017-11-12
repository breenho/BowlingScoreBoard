require "./input_split.rb"
class ScoreBowling < InputSplit
	def calculate(input)
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
	end
end

input = InputSplit.new
# input = "90909090909090909090"
# input.form_input_array("xxxxxxxxxxxx")
# input.form_input_array("00000000000000000000")
# input.form_input_array("90909090909090909090")
# input.form_input_array("5/5/5/5/5/5/5/5/5/5/5")
# input.form_input_array("14456/5/00017/6/002/6") # Last one value for spare
# input.form_input_array("9/356136815325807181")
# input.form_input_array("903/613/815/0/807/80")
# input.form_input_array("x3/61xxx2/907/xxx") # Last two strikes has to be added
input_array = input.form_input_array("x3/61xxx2/907/xxx")

score_bowling = ScoreBowling.new
score_bowling.calculate(input_array)