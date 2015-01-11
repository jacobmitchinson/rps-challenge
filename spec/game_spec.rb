describe Game do 

  it 'should know when a game has been won' do
    player.move = "Rock"
    allow(:computer).to receive(:move).and_return("scissors")
    expect(game.win?).to be_true
  end

end