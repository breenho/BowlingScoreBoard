STRIKE = "x"
SPARE = "/"

class InputSplit
	def form_input_array(input_val)
		input = input_val.dup # When using rspec, the input string could not be passed as the string was frozen when coming from Rspec specs.
		array_input = []
		10.times do |frame| # 10 times loop for 10 frames
			frame_vals = []
			# Processing every character from the overall string by slicing it and making a decision to create an array and appending it based on its value. Either a strike or spare or any numbers. Also, processing its position too.
			first_val = input.slice!(0) # Fetching the first char of a string
			if  is_strike?(first_val) # checks. if it is a strike, form an array as [10,0] and move the pointer to next char and frame
				frame_vals = [10,0]
			elsif !is_strike?(first_val) && !is_spare?(first_val) && is_value?(first_val) # neither strike nor spare
				frame_vals[0] = first_val # place in the array value - first position
				second_val = input.slice!(0) # slicing next immediate value
				if !is_strike?(second_val) # If not strike, place in the second value of array
					frame_vals[1] = second_val
				else # Strike can not occur in your second try of a frame
					error "Input String is wrong. You can not get a strike on your second try"
					break
				end
			elsif is_spare?(first_val) # Spare can not occur in first try of a frame
				error "Input String is wrong. You can not get a spare on your first try"
				break
			end
			array_input.push(frame_vals) # form the resultant 2D array. This will not contain the values of frame if the last attempt was either strike or a spare
		end

		# Code to append a new array if the last try of the frame was either strike or a spare.
		# Need to avoid the following method and have to handle it in the above block with 11.times {} by default.
		# but proceeded with this solution inorder to display more specific error messages based on the last position values
		additional_array = []
		if array_input.count == 10 && array_input[-1][0] == 10 # If the first position value of last array is a strike, then need to consider the next two tries values to get the last frame's total value
			first_val = input.slice!(0)
			if !is_nil?(first_val)
				if !is_spare?(first_val)
					additional_array[0] = ternary_condition(first_val)
					second_val = input.slice!(0)
					if !is_nil?(second_val)
						additional_array[1] = ternary_condition(second_val)
					else
						error "Input String is wrong. Your second bonus throw is missing. You must throw couple of balls if you have hit a strike on your last frame."
					end
				else
					error "Input String is wrong. 'Spare' at the wrong position"
				end
			else
				error "Input String is wrong. You must throw couple of balls if you have hit a strike on your last frame."
			end
			array_input.push(additional_array)
		elsif (array_input.count == 10) && is_spare?(array_input[-1][1])  # If the second position value of last array is a spare, then need to consider the next one throw value to get the last frame's total value
			first_val = input.slice!(0)
			if !is_nil?(first_val)
				if !is_spare?(first_val)
					additional_array = [first_val,0]
				else
					error "Input String is wrong. 'Spare' at the wrong position"
				end
			else
				error "Input String is wrong. You have a bonus throw if you have hit a spare on your last frame."
			end
			array_input.push(additional_array)
		end

		if !is_nil?(input.slice!(0))
			error "Input String is wrong. You have exceeded the limited input value"
		end
		p array_input
	end

#Method to check if the value is a strike
	def is_strike?(value)
		value == STRIKE
	end
#Method to check if the value is a spare
	def is_spare?(value)
		value == SPARE
	end
#Method to check if the value is neither striker nor spare
	def is_value?(value)
		value.to_i < 10
	end
#Method to check if the value is nil
	def is_nil?(value)
		value.nil?
	end
#Method to return an error message passed to it
	def error(message)
		p message
	end
#Method to define a ternary condition. To avoid duplication
	def ternary_condition(value)
		is_strike?(value) ? 10 : value
	end
end