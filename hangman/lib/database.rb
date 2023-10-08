require "yaml"

module Database
  def save
    @id = next_id
    Dir.mkdir("saves") unless Dir.exists?("saves")
    dados = serialize_game
    create_file_save dados

    puts "Jogo salvo"
    exit
  end

  def next_id
    Dir.glob("saves/*.yaml").size + 1
  end

  def create_file_save(data)
    File.open("saves/game_save_#{id}.yaml", "w") do |file|
      file.puts(data)
    end
  end

  def serialize_game
    YAML.dump self
  end

  def load(id)
    game_serialize = File.read("saves/game_save_#{id}.yaml")
    data = deserialize_game(game_serialize)
    puts "Jogo carregado"
    @attempts = data.attempts
    @secret_word = data.secret_word
    @hidden_secret_word = data.hidden_secret_word
    @guessed_letters = data.guessed_letters
    @incorrects_letters = data.incorrects_letters
  end

  def deserialize_game(game_serialize)
    data = YAML.load game_serialize
  end
end


# Carregar um jogo o elsalvo, buscande pelo o identificador(id)
# Deserializar as informações do jogo, criar novamente com aqueles estados
