require_relative 'player'

class ClumsyPlayer < Player

  def found_treasures(treasure)
    damaged_treasure = Treasure.new(treasure.name, treasure.points / 2.0.to_i)
    super damaged_treasure
  end
end

if __FILE__ == $0
  clumsy = ClumsyPlayer.new("klutz")

  hammer = Treasure.new(:hammer, 50)
  clumsy.found_treasures(hammer)
  clumsy.found_treasures(hammer)
  clumsy.found_treasures(hammer)

  crowbar = Treasure.new(:crowbar, 400)
  clumsy.found_treasures(crowbar)

  clumsy.each_found_treasure do |treasure|
    puts "#{treasure.points} total #{treasure.name} points"
  end
  puts "#{clumsy.points} grand total points"
end
