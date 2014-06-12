require_relative 'game'

player1 = Player.new("fozzie")
player2 = Player.new("kermit", 60)
player3 = Player.new("gonzo", 125)

muppets = Game.new("Muppets")
muppets.add_player(player1)
muppets.add_player(player2)
muppets.add_player(player3)

loop do
  puts "\nHow many rounds do you want to play? ('quit' to exit)"
  answer = gets.chomp.downcase

  case answer
  when /^\d+$/
    muppets.play(answer.to_i)
  when 'quit', 'exit'
    muppets.print_stats
    break
  else
    puts "\nPlease enter a number or type 'quit'"
  end
end
