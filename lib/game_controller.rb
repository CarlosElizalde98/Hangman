require_relative 'dictionary'
require_relative 'hangman'

class Game
  def initialize
    @game_win = false
    @game_loss = false
    @dictionary = Dictionary.new()
    @random_word = @dictionary.choose_random_word()
  end

  def game_round
    puts "Welcome to Hangman! Please enter a letter to get started"
    man = Hangman.new(@random_word)
    while @game_win == false && @game_loss == false
      guess = gets.chomp()
      make_guess(guess, man)
    end
  end

  def make_guess(guess, man)
    man.validate_guess(guess)
    check_game_status(man)
  end

  def check_game_status(man)
    if man.correct_letters.join == man.word
      @game_win = true
    elsif man.incorrect_letters.length == man.word.length
      @game_loss = true
    end
  end
end

test = Game.new()
test.game_round()