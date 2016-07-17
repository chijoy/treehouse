class Contact
	attr_writer :first_name, :middle_name, :last_name

	def first_name
		@first_name
	end

	def middle_name
		@middle_name
	end

	def last_name
		@last_name
	end

	def first_last
		first_last = first_name + " " + last_name
		first_last
	end

	def full_name
		full_name = first_name
		if !middle_name.nil?
			full_name += " "
			full_name += middle_name
		end
		full_name += " "
		full_name += last_name
		full_name
	end

	def last_first
		last_first = last_name + ", " + first_name
		if !middle_name.nil?
			last_first += " "
			last_first += middle_name.slice(0, 1)
			last_first += "."
		end
		last_first
	end

	def to_s(format = "full_name")
		case format
		when "full_name"
			full_name
		when "last_first"
			last_first
		when "first"
			first_name
		when "last"
			last_name
		else
			first_last
		end
	end
end

joy = Contact.new
joy.first_name = "Joy"
joy.middle_name = "Anne"
joy.last_name = "McCaffrey"
puts joy.to_s("full_name")
puts joy.to_s("last_first")
puts joy.to_s("first_last")

stacey = Contact.new
stacey.first_name = "Stacey"
stacey.last_name = "Buras"
puts stacey.full_name
