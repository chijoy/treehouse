class Monster
	attr_reader :name, :actions

	def initialize(name)
		@name = name
		@actions = {
			screams: 0,
			scares: 0,
			runs: 0,
			hides: 0
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

	def scare(&block)
		actions[:scares] += 1
		print "#{name} scares you! "
		yield
	end

	def hide(&block)
		actions[:hides] += 1
		print "#{name} hides! "
		yield
	end

	def run(&block)
		actions[:runs] += 1
		print "#{name} runs! "
		yield
	end

	def print_scoreboard
		puts "-" * 10
		puts "#{name}'s Scoreboard:"
		puts "-" * 10
		puts "Screams:  #{actions[:screams]}"
		puts "Runs:  #{actions[:runs]}"
		puts "Hides:  #{actions[:hides]}"
		puts "Scares:  #{actions[:scares]}"
	end
end

monster = Monster.new("Fluffy")
monster.speak { puts "Hi."}
puts monster.actions

monster.scream do
	puts "Gah!!! "
end

monster.scare do 
	puts "Boo!!! "
end

monster.hide do 
	puts "I'm hiding!!! "
end

monster.run do 
	puts "I'm coming after you!!! "
end

puts monster.actions
puts "\n"
puts monster.print_scoreboard