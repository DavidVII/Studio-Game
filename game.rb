require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game
  attr_reader :title

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def print_name_and_health(player)
    puts "#{player.name} (#{player.health})"
  end

  def print_stats
    strong_players, wimpy_players = @players.partition { |p| p.strong? }

    puts "\n#{@title} Stats:"

    puts "\n#{strong_players.size} strong players:"
    strong_players.each do |player|
      print_name_and_health(player)
    end

    puts "\n#{wimpy_players.size} wimpy players:"
    wimpy_players.each do |player|
      print_name_and_health(player)
    end

    puts "\n#{@title}'s High Scores:"
    @players.sort.each do |player|
      formated_name = player.name.ljust(20, '.')
      puts "#{formated_name}#{player.score}"
    end

    @players.each do |player|
      puts "\n#{player.name}'s point totals:"
      puts "#{player.points} total points"
    end
  end

  def play(rounds)
    puts "There are #{@players.size} players in the game:"
    @players.each do |player|
      puts player
    end

    treasures = TreasureTrove::TREASURES

    puts "\nThere are #{treasures.size} treasures to be found:"

    treasures.each do |t|
      puts "A #{t.name} is worth #{t.points} points"
    end

    1.upto(rounds) do |round|
      puts "\nRound #{round}:"

      @players.each do |player|
        GameTurn.take_turn(player)
        puts player
      end
    end
  end
end
