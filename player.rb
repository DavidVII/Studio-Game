require_relative 'treasure_trove'

class Player
  attr_accessor :name
  attr_reader :health

  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
    @found_treasure = Hash.new(0)
  end

  def blam
    @health -= 10
    puts "#{@name} got blammed!"
  end

  def w00t
    @health += 15
    puts "#{@name} got w00ted!"
  end

  def score
    @health + @name.length
  end

  def strong?
    @health > 100
  end

  def found_treasure(treasure)
    @found_treasure[treasure.name] += treasure.points

    puts "#{@name} found a #{treasure.name} worth #{treasure.points} points"
    puts "#{@name}'s treasure: #{@found_treasure}"
  end

  def points
    @found_treasure.values.reduce(0, :+)
  end

  def to_s
    "I'm #{@name} with a health of #{@health} and a score of #{score}."
  end

  def <=>(other)
    other.score <=> score
  end
end

if __FILE__ == $0
  player = Player.new("moe")
  puts player.name
  puts player.health
  player.w00t
  puts player.health
  player.blam
  puts player.health
end
