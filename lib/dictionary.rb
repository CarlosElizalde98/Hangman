class Dictionary
  attr_accessor :chosen_word

  def initialize
    @chosen_word = ""
  end

  def load_in
    dictionary = []
    contents = File.readlines('./google-10000-english-no-sweats.txt', chomp: true)
    contents.each do |word|
      dictionary << word
    end
    dictionary
  end

  def choose_random_word
    dictionary = self.load_in()
    criteria_words = dictionary.select {|word| (word.length >= 5 && word.length <= 12)}
    chosen_word = criteria_words.sample()
    chosen_word
  end
end

