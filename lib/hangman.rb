class Hangman
  attr_accessor :word, :score, :incorrect_letters, :correct_letters
  
  def initialize(word)
    @word = word
    @score = 0
    @correct_letters = Array.new(@word.length, "_")
    @incorrect_letters = []
  end

  def update_score(score)
    self.score += score
  end

  def validate_guess(letter)
    word_array = @word.split('')
    p @word
    if word_array.include?(letter)
      word_array.each_with_index {|item, index| 
      if item == letter
        @correct_letters[index] = letter
      end}
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
    puts "incorrect letters: #{incorrects} \n 
    attempts left: #{@incorrect_letters.length} / #{@word.length}"
  end
end