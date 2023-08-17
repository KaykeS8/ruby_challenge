require "../5.jogo_da_velha/tic_tac_toe.rb"

module Games
  include TicTacToeGame
end

tic_tac_toe = Games::TicTacToe.new
tic_tac_toe.play