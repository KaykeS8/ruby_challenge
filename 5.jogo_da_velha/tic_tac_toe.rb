module TicTacToeGame
  WIN_COMBINATION = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]

  class TicTacToe
    attr_accessor :players
    attr_reader :players, :available_positions
    def initialize()
      @players = []
      @board = %w[1 2 3 4 5 6 7 8 9]
      @current_player = []
      @available_positions = [1,2,3,4,5,6,7,8,9]
    end

    def play 
      puts "Seje bem vindo ao jogo da velha. Preencha as informações abaixo para iniciar o game ↓"
      sleep(1.4)
      print "Digite seu nome player-1: "
      @player_name_1 = gets.chomp.strip
      print "Digite seu nome player-2:"
      @player_name_2 = gets.chomp.strip

      player1 = PlayerHuman.new(@player_name_1, self, 'X')
      player2 = PlayerHuman.new(@player_name_2, self,'O')
      self.players = [player1, player2]
      @current_player = @players[0]

      puts "Você tem jogadas de 1 a 9"
      loop do
        print_board
        choose_position = @current_player.choose_position
        update_available_position(choose_position)
        @board[choose_position - 1] = @current_player.marker

        if winner?(@current_player)
          print_board
          sleep(0.5)
          puts "#{@current_player.name} venceu a partida"
          play_again?
        end
        if draw?
          print_board
          sleep(0.5)
          puts "Partida empatada"
          play_again?
        end
          switch_player
        end
    end

    def print_board
      divider = "--+---+--"
      puts "\n#{@board[0]} | #{@board[1]} | #{@board[2]}"
      print divider
      puts "\n#{@board[3]} | #{@board[4]} | #{@board[5]}"
      print divider
      puts "\n#{@board[6]} | #{@board[7]} | #{@board[8]}"
    end

    def winner?(player)
      WIN_COMBINATION.any? do |combination|
        combination.all? {|position| @board[position - 1] == player.marker}
      end
    end

    def draw?
      @available_positions.empty?
    end

    def update_available_position(position)
      @available_positions.delete(position)
    end

    def switch_player
      @current_player = @current_player == @players[0] ? @players[1] : @players[0]
    end

    def play_again?
      loop do
        print "\n Deseja jogar novamente? s/n : "
        answer = gets.chomp.downcase
        if answer == 'n'
          exit
        elsif answer == 's'
          initialize
          play
        end
      end
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
        print "Digite uma posição valida #{name}: "
        position_chosen = gets.chomp.to_i
        if @game_class.available_positions.include?(position_chosen)
          return position_chosen
        end
        puts "\nEntrada invalida"
        @game_class.print_board
      end
    end
  end
end