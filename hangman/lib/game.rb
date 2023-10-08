# https://replit.com/@mmaludy/hangman#main.rb
require "yaml"
require_relative "database.rb"
require_relative "text_instructions.rb"

class Hangman
  include TextInstructions
  include Database

  attr_reader :id, :secret_word, :hidden_secret_word, :attempts, :guessed_letters, :incorrects_letters

  def initialize
      @secret_word = random_secret_word
      @hidden_secret_word = hidden_word
      @attempts = 9
      @guessed_letters = []
      @incorrects_letters = []
      play
  end
  
  def play
    display_instruction
    display_start
    input_answer = gets.chomp.strip
    until input_answer.match?(/^1$|^2$/)
      display_start
      input_answer = gets.chomp.strip
    end
    input_answer == '1' ? create_a_new_game : load_a_game_save
  end

  def random_secret_word
    word_random = File.readlines('dictionary.txt', chomp: true).sample.downcase
    return word_random if (5..12).cover?(word_random.length)
    random_secret_word
  end

  def create_a_new_game
    # p @secret_word
    print_lines
    moves_for_guess until @attempts.zero? || victory?
    if victory?
      display_win
    else
      display_lose(@secret_word)
    end
    self.play_again
  end
  
  def moves_for_guess
    display_guess
    guess = gets.chomp.downcase.strip
    puts ""
    exit_the_game if guess == 'sair'
    save if guess == 'salvar'
    check_guess?(guess)
    print_lines
    display_remaining_moves(@attempts)
    display_incorrects_letter(@incorrects_letters)
    puts ""
  end

  def print_lines
      puts @hidden_secret_word
  end

  def update_lines(guess)
    word_array = @secret_word.split("")
    hidden_array = @hidden_secret_word.split("")
    word_array.each_with_index do |letter, index|
      hidden_array[index * 2] = guess if guess == letter
    end
    @hidden_secret_word = hidden_array.join('')
  end

  def victory?
    @hidden_secret_word.split(' ') == @secret_word.split('')
  end

  def hidden_word
    '_ ' * @secret_word.length
  end

  def check_guess?(guess)
    if @secret_word.include?(guess)
      puts "Seu palpite está correto"
      @guessed_letters << guess
      update_lines(guess)
    else
      puts "Seu palpite está incorreto"
      @incorrects_letters << guess
      @attempts-= 1
      send("draw_hangman#{@attempts}")
    end
  end

  def exit_the_game
    display_exit_the_game
    exit
  end

  def load_a_game_save
    Dir.entries('saves').each_with_index do |file, index|
      if file.include?(".yaml")
        puts "[#{index + 1}] #{file}"
      end
    end
    total_arquivos = Dir.glob("saves/*.yaml").size
    print "Qual jogo gostaria de carregar: "
    answer = gets.chomp
    until answer.match?(/\d+/) && (1..total_arquivos).cover?(answer.to_i)
      print "Qual jogo gostaria de carregar: "
      answer = gets.chomp
    end
    load(answer)
    create_a_new_game
  end
  
  def play_again
    puts "Deseja jogar novamente: y[yes]/ n[NO]"
    response = gets.chomp.downcase
    until response.match?(/^y$|^n$/)
      puts "Deseja jogar novamente: y[yes]/ n[NO]"
      response = gets.chomp.downcase
    end
    response == 'y' ? Hangman.new : exit
  end

end

hangman = Hangman.new