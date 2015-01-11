require 'game'

describe Game do 

  let(:player) { Player.new }
  let(:computer) { Computer.new }
  let(:game) { Game.new }

  it 'should know when a game has been won' do
    player.move = "rock"
    allow(computer).to receive(:move).and_return("scissors")
    expect(game(computer,player).win?).to be_true
  end

end