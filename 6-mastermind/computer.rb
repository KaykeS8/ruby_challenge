class Computer
  COLORS = %w[vermelho laranja amarelo verde azul roxo]

  def initialize
    # @code = [COLORS.sample, COLORS.sample, COLORS.sample, COLORS.sample]
    @code = ['verde', 'vermelho', 'azul', 'roxo']
  end

  def code_match(code_guess)
    if @code == code_guess
      puts "Você acertou o código"
      puts "O código era: #{@code}"
      puts "Fim de jogo..."
      return winner = true
    else
      matches_partials(@code, code_guess)
    end
  end

  def matches_partials(code, code_guess)
    correct_positions = 0
    correct_colors = 0
    code_counts = Hash.new(0)
    guess_counts = Hash.new(0)

    code_guess.each_with_index do |color, index|
      if code[index] == color
        correct_positions += 1
      else
        code_counts[code[index]] += 1
        guess_counts[color] += 1
      end
    end

    code_counts.each do |color, count|
      correct_colors += [count, guess_counts[color]].min
    end
    puts "Você acertou a cor e posição de: #{correct_positions}"
    puts "Você acertou a cor de: #{correct_colors}"
  end

end





# def matches_partials(code, code_guess)
#   correct_positions = 0
#   correct_colors = 0
  
#   code_guess.each_with_index do |color, index|
#     if code.include?(color) && code[index] == color
#         correct_positions+=1
#     end
#     if code.include?(color)
#       correct_colors+=1
#     end
#   end
#   puts "Você acertou a cor e posição de: #{correct_positions}"
#   puts "Você acertou a cor de: #{correct_colors}"
# end