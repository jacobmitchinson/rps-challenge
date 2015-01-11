class Game

  attr_accessor :player1, :player2
  attr_reader :winner

  def initialize 
    @winner = nil
    @draw = "Draw"
  end

  def add_player(player)
    self.player1 ? self.player2 = player : self.player1 = player
  end

  def winning_moves 
    {"rock" => "scissors", "scissors" => "paper", "paper" => "rock"}
  end

  def check
    if winning_moves[player1.move] == player2.move
      @winner = player1.name
    elsif player1.move == player2.move
      @draw
    else 
      @winner = player2.name
    end
  end

end