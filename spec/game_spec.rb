require 'game'

describe Game do 

  let(:player) { Player.new }
  let(:computer) { Computer.new }
  let(:game) { Game.new }

  it 'should know when a game has been won' do
    player.move = "rock"
    allow(computer).to receive(:move).and_return("scissors")
    game.add_player(player)
    game.add_player(player)
    expect(game.win?).to be true
  end

end