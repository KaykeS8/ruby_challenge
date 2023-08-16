module TicTacToe
  WIN_COMBINATION = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]

  class Game

    attr_accessor :players
    attr_reader :players, :available_positions
    def initialize()
      @players = []
      @board = %w[1 2 3 4 5 6 7 8 9]
      @available_positions = [1,2,3,4,5,6,7,8,9]
    end

    def play 
      puts "Seje bem vindo ao jogo da velha. Preencha as informações abaixo para iniciar o game ↓"
      # sleep(1.4)
        print "Digite seu nome player-1: "
        @player_name_1 = gets.chomp.strip
        print "Digite seu nome player-2:"
        @player_name_2 = gets.chomp.strip

        player1 = PlayerHuman.new(@player_name_1, self, 'X')
        player2 = PlayerHuman.new(@player_name_2, self,'O')
        self.players = [player1, player2]

        puts "Você tem jogadas de 1 a 9"
        print_board
    end

    def print_board
      divider = "--+---+--"
      puts "\n#{@board[0]} | #{@board[1]} | #{@board[2]}"
      print divider
      puts "\n#{@board[3]} | #{@board[4]} | #{@board[5]}"
      print divider
      puts "\n#{@board[6]} | #{@board[7]} | #{@board[8]}"
    end

    def win?

    end

  end

  class Player
    attr_reader :name, :marker
    def initialize(name, game_class, marker)
      @name = name
      @marker = marker
      @game_class = game_class
    end
  end

  class PlayerHuman < Player
    def choose_position
      loop do
        print "Digite uma posição valida: "
        position_chosen = gets.chomp.to_i
        if @game_class.available_positions.include?(position_chosen)
          return position_chosen
        end
        puts "\nEntrada invalida"
      end
    end
  end

end

include TicTacToe
tic_tac = Game.new
tic_tac.play

# https://replit.com/@rreiso/TicTacToe-Ruby#main.rb