require 'player'

describe Player do 

  let(:player) { Player.new }

  it 'should have a name' do 
    player.name = 'Jake'
    expect(player.name).to eq 'Jake'
  end 

end