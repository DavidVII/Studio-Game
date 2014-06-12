require_relative 'game'

player1 = Player.new("fozzie")
player2 = Player.new("kermit", 60)
player3 = Player.new("gonzo", 125)

muppets = Game.new("Muppets")
muppets.add_player(player1)
muppets.add_player(player2)
muppets.add_player(player3)
muppets.play(4)
muppets.print_stats


