class Game

  attr_accessor :player1, :player2

  def add_player(player)
    self.player1 ? self.player2 = player : self.player1 = player
  end

  def win?
    true
  end

  def lost?
    true
  end

end