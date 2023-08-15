module TicTacToe

  LINES = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  class Game
    def initialize(player_1_class, player_2_class)
      @board = Array.new(10)
      @current_player_id = 0
      @Players = [player_1_class.new(self, "X"), player_2_class.new(self, "O")]
    end
  end


  def free_position
    (1..9).select {|position| @board[position].nil?}
  end
end


class Player
  def initialize(name, marker)
    @name = name
    @marker = marker
  end
  attr_reader :marker
end

class HumanPlayer < Player
end

class ComputerPlayer < Player
end

include TicTacToe
p Game.new(HumanPlayer, ComputerPlayer).free_position