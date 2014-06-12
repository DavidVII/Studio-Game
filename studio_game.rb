require_relative 'game'

game = Game.new("Treasure Hunter")
game.load_players(ARGV.shift || "players.csv")

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
