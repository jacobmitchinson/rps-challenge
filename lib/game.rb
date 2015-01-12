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
    player1_move = player1.move
    player2_move = player2.move
    if winning_moves[player1_move] == player2_move
      player1
    elsif player1_move == player2_move
      @draw
    else 
      player2
    end
  end

end