require 'treasure_hunter/player'

module TreasureHunter
  describe Player do

    before do
      $stdout = StringIO.new
      @initial_health = 150
      @player = Player.new("fozzie", @initial_health)
    end

    it 'has a capitalized name' do
      expect(@player.name).to eq("Fozzie")
    end

    it 'has an initial health' do
      expect(@player.health).to eq(150)
    end

    it 'has a string representation' do
      @player.found_treasures(Treasure.new(:hammer, 50))
      @player.found_treasures(Treasure.new(:hammer, 50))

      expect(@player.to_s).to eq("I'm Fozzie with health = 150, points = 100, and score = 250.")
    end

    it "computes a score as the sum of its health and points" do
      @player.found_treasures(Treasure.new(:hammer, 50))
      @player.found_treasures(Treasure.new(:hammer, 50))

      expect(@player.score).to eq(@initial_health + 100)
    end

    it 'increases health by 15 when w00ted' do
      @player.w00t

      expect(@player.health).to eq(@initial_health + 15)
    end

    it 'decreases health by 10 when blammed' do
      @player.blam

      expect(@player.health).to eq(@initial_health - 10)
    end

    context 'with a health greater than 100' do
      before { @player = Player.new('Fozzie', 150) }

      it 'is strong' do
        expect(@player).to be_strong
      end
    end

    context 'with a health of 100 or less' do
      before { @player = Player.new('fozzie', 100) }

      it 'is wimpy' do
        expect(@player).not_to be_strong
      end
    end

    context 'in a collection of players' do
      before do
        @player_one   = Player.new("Fozzie", 100)
        @player_two   = Player.new("Kermit", 200)
        @player_three = Player.new("Gonzo", 300)

        @players = [ @player_one, @player_two, @player_three ]
      end

      it 'is sorted by decending score' do
        expect(@players.sort).to eq [ @player_three, @player_two, @player_one ]
      end
    end

    it "computes points as the sum of all treasure points" do
      expect(@player.points).to eq 0

      @player.found_treasures(Treasure.new(:hammer, 50))

      expect(@player.points).to eq 50

      @player.found_treasures(Treasure.new(:crowbar, 400))

      expect(@player.points).to eq 450

      @player.found_treasures(Treasure.new(:hammer, 50))

      expect(@player.points).to eq 500
    end

    it "yields each found treasure and its total points" do
      @player.found_treasures(Treasure.new(:skillet, 100))
      @player.found_treasures(Treasure.new(:skillet, 100))
      @player.found_treasures(Treasure.new(:hammer, 50))
      @player.found_treasures(Treasure.new(:bottle, 5))
      @player.found_treasures(Treasure.new(:bottle, 5))
      @player.found_treasures(Treasure.new(:bottle, 5))
      @player.found_treasures(Treasure.new(:bottle, 5))
      @player.found_treasures(Treasure.new(:bottle, 5))

      yielded = []

      @player.each_found_treasure do |treasure|
        yielded << treasure
      end

      expect(yielded).to eq [
        Treasure.new(:skillet, 200),
        Treasure.new(:hammer, 50),
        Treasure.new(:bottle, 25)
      ]
    end

    it 'can be created from a CSV string' do
      player = Player.from_csv('fozzie,100')

      expect(player.name).to eq 'Fozzie'
      expect(player.health).to eq 100
    end
  end
end
