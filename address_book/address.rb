class Address
	attr_accessor :kind, :street_1, :street_2, :city, :state, :postal_code

	def to_s(format = "short")
		address = ""
		case format
		when "short"
			address += "#{kind}: "
			address += street_1
			if street_2
				address += " " + street_2
			end
			address += ", #{city}, #{state}, #{postal_code}"
		end
		address
	end
end

home = Address.new
home.kind = "Home"
home.street_1 = "123 Main St."
home.street_2 = "Apt. F"
home.city = "Chicago"
home.state = "IL"
home.postal_code = "60657"

puts home.to_s("short")