require 'game'

describe Game do 

  let(:player) { Player.new }
  let(:computer) { Computer.new }
  let(:game) { Game.new }

  before do 
    game.add_player(player)
    game.add_player(comuter)
  end

  it 'should know when a game has been won' do
    player.move = "rock"
    allow(computer).to receive(:move).and_return("scissors")
    expect(game.win?).to be true
  end

end