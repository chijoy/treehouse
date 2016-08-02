# Using a class
# class Customer
# 	attr_accessor :name, :email

# 	def initialize(name, email)
# 		@name, @email = name, email
# 	end
# end

# customer = Customer.new("Joy", "joy@gmail.com")
# puts customer.inspect

# the same using struct
# Customer = Struct.new(:name, :email)

# customer = Customer.new("Joy", "joy@gmail.com")
# puts customer.inspect

# add a block
Customer = Struct.new(:name, :email) do
	def name_with_email
		"#{name} at #{email}."
	end
end


customer = Customer.new("Joy", "joy@gmail.com")
puts customer.inspect
puts customer.name_with_email
customer.each do |attribute|
	puts attribute
end

