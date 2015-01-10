require 'player'

describe Player do 

  let(:player) { Player.new }

  it 'should have a name' do 
    player.name = 'Jake'
    expect(player.name).to eq 'Jake'
  end 

  it 'should make a move' do
    player.move = "rock"
    expect(player.move).to eq 'rock' 
  end

end