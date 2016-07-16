class Monster
	attr_reader :name, :actions

	def initialize(name)
		@name = name
		@actions = {
			screams: 0
		}
	end

	def speak(&block)
		print "#{name} says... "
		yield
	end

	def scream(&block)
		actions[:screams] += 1
		print "#{name} screams!!! "
		yield
	end
end

monster = Monster.new("Fluffy")
monster.speak { puts "Hi."}
monster.scream do
	puts "BOO!!! "
end
puts monster.actions