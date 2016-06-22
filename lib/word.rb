# frozen_string_literal: true
class Word
  def initialize(word)
    @word = word.upcase.split(//)
    @used_letters = []
  end

  def guess(letter)
    return false if used_letter letter
    return use_letter letter if letter? letter
    return false unless letter? letter
  end

  def word_guess
    uncovered = []
    word.each.with_index do |value, index|
      uncovered[index] = "_" unless used_letters.include? value
      uncovered[index] = value if used_letters.include? value
    end
    uncovered
  end

  def to_string
    word.join("")
  end

  attr_reader :word, :used_letters

  private

  def letter?(letter)
    word.include? letter
  end

  def used_letter(letter)
    used_letters.include? letter
  end

  def use_letter(letter)
    return false if used_letters.include? letter
    used_letters << letter
    true
  end
end
