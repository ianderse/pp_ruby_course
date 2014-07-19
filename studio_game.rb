require_relative 'game'
require_relative 'player'

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

knuckleheads = Game.new("knuckleheads")
knuckleheads.load_players(ARGV.shift || "players.csv")

loop do
	puts "\nHow many game rounds? ('quit' to exit)"
	answer = gets.chomp.downcase

	case answer
	when /^\d+$/
		knuckleheads.play(answer.to_i)
	when 'quit'
		knuckleheads.print_stats
		knuckleheads.save_high_scores
		break
	else
		puts "not a valid response"
	end
end