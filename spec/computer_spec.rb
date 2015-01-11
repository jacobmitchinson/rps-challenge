describe Computer do 

  it 'should make a move' do 
    expect(computer.move).to eq "rock" || "paper" || "scissors"
  end

end