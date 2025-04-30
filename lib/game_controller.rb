require_relative 'dictionary'
require_relative 'hangman'
require_relative 'serialize'

class Game
  include BasicSerializable

  def initialize
    @game_win = false
    @game_loss = false
    @dictionary = Dictionary.new()
    @random_word = @dictionary.choose_random_word()
    @man = Hangman.new(@random_word)
  end

  def game_round
    puts "Welcome to Hangman! Please enter a letter to get started"
    puts "Type in 'save' or 'load' to save or load a game!"
    while @game_win == false && @game_loss == false
      guess = gets.chomp()
      if guess == 'save'
        save_game()
      elsif guess == 'load'
        load_game()
      else
        make_guess(guess)
      end
    end
  end

  def make_guess(guess)
    @man.validate_guess(guess)
    check_game_status()
  end

  def check_game_status()
    if @man.correct_letters.join == @man.word
      @game_win = true
    elsif @man.incorrect_letters.length == @man.word.length
      @game_loss = true
    end
  end

  def save_game
    game = self.serialize
    Dir.mkdir('saves') unless Dir.exist?('saves')
    filename = "saves/save.json"
    File.open(filename, 'w') do |file|
      file.puts game
    end
  end

  def load_game
    if Dir.exist?('saves')
      game = File.read('saves/save.json')
      self.unserialize(game)
 
      game_round()
    else
      puts "No save game found. Start a new one!"
    end
  end
end

test = Game.new()
test.game_round()
test.save_game()