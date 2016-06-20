class Word
  def initialize(word)
    @word = word.split(//)
    @used_letters = []
    @word_guess = Array.new(word.length, "_")
  end

  def use_letter(letter)
    if (!used_letters.include? letter) then
      used_letters << letter
      return true
    else
      return false
    end
  end

  attr_reader :word
  attr_accessor :used_letters, :word_guess

  private

  attr_writer :try
end
