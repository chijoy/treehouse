class Player
	include Comparable
	attr_accessor :name, :score

	def <=>(other_player)
		socre <=> other_player.score
	end

	def initialize(name, score)
		@name = name
		@score = score
	end
end

class Game
	attr_accessor :players

	def initialize
		@players = []
	end

	def add_player(player)
		players.push(player)
	end

	def score
		score = 0
		players.each do |player|
			score += player.score
		end
		score
	end
end

player1 = Player.new("Jason", 100)
player2 = Player.new("Kenneth", 80)
player3 = Player.new("Nick", 95)
player4 = Player.new("Craig", 20)

game1 = Game.new
game1.add_player(player1)
game1.add_player(player2)

game2 = Game.new
game2.add_player(player3)
game2.add_player(player4)

puts game1.inspect