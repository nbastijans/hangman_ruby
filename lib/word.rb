# frozen_string_literal: true
class Word
  def initialize(word)
    @word = word.split(//)
    @used_letters = []
    @word_guess = Array.new(word.length, "_")
  end

  def use_letter(letter)
    if !used_letters.include? letter
      used_letters << letter
      return true
    else
      return false
    end
  end

  attr_reader :word, :used_letters
  attr_accessor :word_guess
end
