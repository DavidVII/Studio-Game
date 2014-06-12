require_relative 'game'
require_relative 'clumsy_player'

game = Game.new("Treasure Hunter")
game.load_players(ARGV.shift || "players.csv")

klutz = ClumsyPlayer.new('klutz', 105)
game.add_player(klutz)

loop do
  puts "\nHow many rounds do you want to play? ('quit' to exit)"
  answer = gets.chomp.downcase

  case answer
  when /^\d+$/
    game.play(answer.to_i)
  when 'quit', 'exit'
    game.print_stats
    break
  else
    puts "\nPlease enter a number or type 'quit'"
  end
end

game.save_high_scores
