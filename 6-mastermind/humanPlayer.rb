class HumanPlayer
  def initialize
    @guess_array = []
    @code = []
    @COLORS = ['vermelho', 'laranja', 'amarelo', 'verde', 'azul', 'roxo']
  end 

  def player_code_input
    puts "Por favor insira o seu código secreto composto por QUATRO cores. Insira uma cor entre as opções a seguir e pressione a tecla Enter:"
    puts "Vermelho, laranja, amarelo, verde, azul e roxo"
    4.times do 
      chosen_color = (gets.chomp).downcase.strip
      until @COLORS.include?(chosen_color)
        puts "Por favor digite uma das QUATRO cores. Vermelho, laranja, amarelo, verde, azul ou roxo"
        chosen_color = (gets.chomp).downcase.strip
      end
      @code.push(chosen_color)
    end
    puts "Seu código secreto é: #{@code}"
    @code
  end


  def player_guess_input
    puts "Digite seu palpite de código, cor por cor, pressionando enter entre cada um."
    puts "Escolha QUATRO das seguites cores: Vermelho, laranja, amarelo, verde, azul, roxo"
    4.times do 
      chosen_color = (gets.chomp).downcase.strip
      until @COLORS.include?(chosen_color)
        puts "Por favor digite uma das QUATRO cores. Vermelho, laranja, amarelo, verde, azul ou roxo"
        chosen_color = (gets.chomp).downcase.strip
      end
      @guess_array.push(chosen_color)
    end
    4.times {@guess_array.shift} if @guess_array.length > 4
    puts "Seu palpite é: #{@guess_array}"
    @guess_array
  end
end