require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game

	attr_reader :title

	def initialize(title)
		@players = []
		@title = title.capitalize
	end

	def add_player(player)
		@players.push(player)
	end

	def play(rounds)
		puts "There are #{@players.size} players in #{@title}: "
		1.upto(rounds) do |round|
			puts "\nRound #{round}:"
			@players.each do |player|
				GameTurn.take_turn(player)
				puts player
			end
		end

		treasures = TreasureTrove::TREASURES
		puts "\nThere are #{treasures.size} treasures to be found:"
		treasures.each do |treasure|
			puts "A #{treasure.name} is worth #{treasure.points} points"
		end
	end

	def print_stats
		strong_players = @players.select { |player| player.strong? }
		wimpy_players = @players.reject { |player| player.strong? }

		puts "\n#{title} Statistics:"
		puts "\n#{strong_players.length} strong players"

		strong_players.each do |player|
			print_name_and_health(player)
		end

		puts "\n#{wimpy_players.length} wimpy players"

		wimpy_players.each do |player|
			print_name_and_health(player)
		end

		puts "\n#{title} High Scores:"
		@players.sort.each do |player|
			puts "#{player.name.ljust(20, '.')} #{player.score}"
		end
	end

	def print_name_and_health(player)
		puts "#{player.name} (#{player.health})"
	end
end