module TextInstructions
  def display_instruction
    puts <<~HERODOC
    Bem-vindo ao Jogo da Forca!

    Prepare-se para um desafio de palavras como nenhum outro. No Jogo da Forca, sua missão é desvendar a palavra secreta antes que suas chances se esgotem. Será que você tem o que é preciso para decifrar o enigma?
    
    Lembre-se, você tem 9 chances para adivinhar corretamente as letras que compõem a palavra. Use suas habilidades de dedução, concentração e conhecimento de vocabulário para vencer.
    
    Não se esqueça de que você pode salvar o jogo a qualquer momento para continuar mais tarde. Quem sabe, talvez você seja o próximo mestre da Forca!
    
    Boa sorte e que as letras estejam a seu favor!
    
    HERODOC
  end

  def display_start
    puts <<~HERODOC
      Escolha uma das opções abaixo para iniciar o jogo
      [1] Iniciar um novo jogo
      [2] Carregar um jogo salvo
    HERODOC
  end

  def display_guess
    puts <<~HERODOC
    Sua vez de adivinhar,digite uma letra para adivinhar a palavra secreta:
    Você pode digitar 'sair' para sair do jogo, ou 'salvar para salvar o jogo'
    HERODOC
  end

  def display_remaining_moves(moves)
    puts "Restam #{moves} jogadas"
  end

  def display_exit_the_game
    puts "Você saiu do jogo."
  end

  def display_incorrects_letter(incorrects_letters)
    puts <<~HERODOC
      Letras incorretas: #{incorrects_letters}
    HERODOC
  end

  def display_win
    puts <<~HERODOC
      Parabéns você ganhou a partida
    HERODOC
  end

  def display_lose(secret_word)
    puts <<~HERODOC
      Você perdeu!
      A palavra secreta era #{secret_word}
    HERODOC
  end

  def draw_hangman8
    puts '
    |
    |
    |
    |
    |
    |
   /|\
  '
  end

  def draw_hangman7
    puts '
    _________
    |/
    |
    |
    |
    |
    |
   /|\
  '
  end

  def draw_hangman6
    puts '
    _________
    |/      |
    |
    |
    |
    |
    |
   /|\
  '
  end

  def draw_hangman5
    puts '
    _________
    |/      |
    |      (_)
    |
    |
    |
    |
   /|\
  '
  end

  def draw_hangman4
    puts '
    _________
    |/      |
    |      (_)
    |       |
    |       |
    |
    |
   /|\
  '
  end

  def draw_hangman3
    puts '
    _________
    |/      |
    |      (_)
    |       |/
    |       |
    |
    |
   /|\
  '
  end

  def draw_hangman2
    puts '
    _________
    |/      |
    |      (_)
    |      \|/
    |       |
    |
    |
   /|\
  '
  end

  def draw_hangman1
    puts '
    _________
    |/      |
    |      (_)
    |      \|/
    |       |
    |      /
    |
   /|\
  '
  end

  def draw_hangman0
    puts '
    _________
    |/      |
    |      (_)
    |      \|/
    |       |
    |      / \
    |
   /|\
  '
  end
end