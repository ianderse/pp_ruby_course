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
			puts high_score_entry(player)
		end

		@players.sort.each do |player|
		  puts "\n#{player.name}'s point totals:"
		  player.each_found_treasure do |treasure|
		  	puts "#{treasure.points} total #{treasure.name} points"
		  end
		  puts "#{player.points} grand total points"
		end
	end

	def print_name_and_health(player)
		puts "#{player.name} (#{player.health})"
	end

	def load_players(file_name)
		File.readlines(file_name).each do |line|
			name, health = line.split(',')
			player = Player.new(name, Integer(health))
			add_player(player)
		end
	end

	def save_high_scores(file_name="high_scores.txt")
		File.open(file_name, "w") do |file|
			file.puts "#{@title} High Scores:"
			@players.sort.each do |player|
				file.puts high_score_entry(player)
			end
		end
	end

	def high_score_entry(player)
		formatted_name = player.name.ljust(20, '.')
		"#{formatted_name} #{player.score}"
	end
end