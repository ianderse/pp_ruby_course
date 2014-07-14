require_relative 'player'
require_relative 'die'
class Game

	attr_reader :title

	def initialize(title)
		@players = []
		@title = title.capitalize
	end

	def add_player(player)
		@players.push(player)
	end

	def play
		puts "There are #{@players.size} players in #{@title}: "

	  	# @players.each do |player|
	   # 		puts player
	  	# end

	  	# @players.each do |player|      
	   #  	player.w00t
	   #  	puts player
	  	# end

		@players.each do |player|
			die = Die.new
			case die.roll
			when 1..2
				player.blam
			when 3..4
				puts "#{player.name} was skipped"
			else
				player.w00t
			end
		end
	end
end