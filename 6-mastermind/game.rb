require "./main.rb"
require "./computer.rb"
require "./humanPlayer.rb"

module MastermindGame
  class MasterMind
    def initialize
      @human_player = HumanPlayer.new
      @computer_player = Computer.new
    end

    def guess_or_create
      puts 'Deseja criar o código para ser adivinhado pelo computador, ou adivinhar o código criado pelo computador (por favor digite "criar" ou "adivinhar")
      '
      answer = (gets.chomp).downcase.strip
      until answer.match?(/^criar$|^adivinhar$/)
        puts "Por favor, escolha se deseja adivinhar o código ou criá-lo digitando 'adivinhar' ou 'criar'\nTente novamente..."
        answer = (gets.chomp).downcase.strip
      end
      if answer == 'criar'
        played_of_create()
      end 

      if answer == 'adivinhar'
        palyed_of_guess()
      end
    end

    def play
      intro
      sleep(1)
      guess_or_create
    end

    def palyed_of_guess
      i = 12
      i.times do 
        guess = @human_player.player_guess_input
        break if @computer_player.code_match(guess)
        i-=1
        puts "Você tem #{i} jogadas\n"
      end
      puts "Você perdeu não acertou o código secreto."
      puts "O código era: #{@computer_player.code}"
      play_again
    end
    
    def played_of_create
      code = @human_player.player_code_input
      i = 12
      i.times do 
        return if @computer_player.player_code_guess
        puts "Computador tem #{i} jogadas"
        @computer_player.code_breaker(code)
        i-=1
      end
      puts "Jogador ganhou a partida"
      play_again
    end
  end

  def play_again
   loop do 
    puts "Deseja jogar novamente? (s/n)"
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
