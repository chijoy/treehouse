module Shout
	def introduce
		puts "Hello! I'm here!"
	end
end

class Person
	include Shout
end

Person.new.introduce
Person.introduce # this won't work

class Dog
	extend Shout
end

Dog.new.introduce # this won't work
Dog.introduce

# extend works at the class level
# include works at the instance level
# the instance of the class gets the methods inside of the module
# you could just include and extend both always