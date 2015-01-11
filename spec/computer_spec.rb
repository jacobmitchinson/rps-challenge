require 'computer'

describe Computer do 

  let(:computer) { Computer.new }

  it 'should make a move' do 
    expect(computer.move).to satisfy { |move| ['rock', 'paper', 'scissors'].include?(move) }
  end

end