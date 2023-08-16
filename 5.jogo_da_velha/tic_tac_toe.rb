module TicTacToe

  class Game

    def initialize(player_1_class, player_2_class)
      @players = [player_1_class, player_2_class]
      @board = []
    end

    def self.play 
      puts "O jogo iniciou"
      print "Digite seu nome player-1: "
      @player_name_1 = gets.chomp
      print "Digite seu nome player-2:"
      @player_name_2 = gets.chomp

      player1 = PlayerHuman.new(@player_name_1, 'X')
      player2 = PlayerHuman.new(@player_name_2, 'O')
      Game.new(player1, player2)
    end


  end

  class Player
    def initialize(name, marker)
      @name = name
      @marker = marker
    end
  end

  class PlayerHuman < Player
  end

end

include TicTacToe
# Game.play

puts "
   1 | 2 | 3
  ---+---+---
   4 | X | 6 
  ---+---+---
   7 | 8 | 9 
   "

   puts rand(9).ceil

=begin
Criar o board a tabela 3x3
Permitir o player fazer uma jogada, e com essa jogada preencher o marker no board
Exemplo :)
   1 | 2 | O
  ---+---+---
   4 | X | 6 
  ---+---+---
   7 | 8 | 9 

=end
