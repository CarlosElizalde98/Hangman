class Hangman
  attr_accessor :word, :score, :incorrect_letters, :correct_letters
  
  def initialize(word)
    @word = word
    @score = 0
    @correct_letters = Array.new(@word.length, "")
    @incorrect_letters = []
  end

  def update_score(score)
    self.score += score
  end

  def validate_guess(letter)
    word_array = @word.split('')
    p word_array
    p @correct_letters
    if word_array.include?(letter)
      index = word_array.find_index(letter)
      @correct_letters[index] = letter
    else
      @incorrect_letters << letter
      self.update_score(1)
    end
    display_word
    display_incorrect
  end

  def display_word()
    word = @correct_letters.join
    puts "correct letters: #{word}"
  end

  def display_incorrect()
    incorrects = @incorrect_letters.join(" ")
    puts "incorrect letters: #{incorrects}"
  end
end