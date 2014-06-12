require_relative 'game'

player1 = Player.new("fozzie")
player2 = Player.new("kermit", 60)
player3 = Player.new("gonzo", 125)

muppets = Game.new("Muppets")
muppets.add_player(player1)
muppets.add_player(player2)
muppets.add_player(player3)

# play up to a 2000 point total
muppets.play(10) do
  muppets.total_points >= 2000
end

muppets.print_stats


