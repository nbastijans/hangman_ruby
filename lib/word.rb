class Word
  def initialize(word)
    @word = word.split(//)
    @used_letters = []
    @word_guess = Array.new(word.length, "_")
  end

  def guess(letter)

  end

  attr_reader :word, :used_letters, :word_guess
end
