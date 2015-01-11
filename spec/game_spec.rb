require 'game'

describe Game do 

  let(:player) { Player.new }
  let(:computer) { Computer.new }
  let(:game) { Game.new }

  before do 
    game.add_player(player)
    game.add_player(computer)
  end

  it 'can add a player' do
    expect(game.player1).to eq player
  end

  it 'can set two players' do 
    expect(game.player2).to eq computer
  end

  it 'should know when a game has been won' do
    player.move = "rock"
    allow(computer).to receive(:move).and_return("scissors")
    expect(game.check).to eq game.player1
  end

  it 'should know when a game has been lost' do 
    player.move = "scissors"
    allow(computer).to receive(:move).and_return("rock")
    expect(game.check).to eq game.player2
  end

  it 'should know when a game is a draw' do 
    player.move = "rock"
    allow(computer).to receive(:move).and_return("rock")
    expect(game.check).to eq "Draw."
  end

end