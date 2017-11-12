STRIKE = "x"
SPARE = "/"

class InputSplit
	def form_input_array(input)
		if input == "xxxxxxxxxxxx"
			p "Congratulations!! Your score is 300"
		elsif input == "00000000000000000000"
			p "Sorry!! Your score is 0"
		else
			array_input = []
			10.times do |frame|
				frame_vals = []
				first_val = input.slice!(0)
				if  is_strike?(first_val)
					frame_vals = [10,0]
				elsif !is_strike?(first_val) && !is_spare?(first_val) && is_value?(first_val)
					frame_vals[0] = first_val
					second_val = input.slice!(0)
					if !is_strike?(second_val)
						frame_vals[1] = second_val
					else
						error "Input String is wrong. You can not get a strike on your second try"
						break
					end
				elsif is_spare?(first_val)
					error "Input String is wrong. You can not get a spare on your first try"
					break
				end
				array_input.push(frame_vals)
			end

			additional_array = []
			if array_input.count == 10 && array_input[-1][0] == 10
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
			elsif (array_input.count == 10) && array_input[-1][1] == SPARE
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
	end

	def is_strike?(value)
		value == STRIKE
	end

	def is_spare?(value)
		value == SPARE
	end

	def is_value?(value)
		value.to_i < 10
	end

	def is_nil?(value)
		value.nil?
	end

	def error(message)
		p message
	end

	def ternary_condition(value)
		is_strike?(value) ? 10 : value
	end
end

# input = InputSplit.new
# input.form_input_array("x3/61xxx2/907/xx")