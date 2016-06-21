# frozen_string_literal: true
class Word
  def initialize(word)
    @word = word.split(//)
    @used_letters = []
  end

  def guess(letter)
    return false if used_letter letter
    return uncover_letter letter if has_letter letter
    return false unless has_letter letter
  end

  def word_guess
    uncovered = []
    word.each.with_index do |value, index|
      uncovered[index] = "_" unless used_letters.include? value
      uncovered[index] = value if used_letters.include? value
    end
    uncovered
  end

  attr_reader :word, :used_letters

  private

  def has_letter(letter)
    word.include? letter
  end

  def used_letter(letter)
    used_letters.include? letter
  end

  def uncover_letter(letter)
    use_letter letter
    true
  end

  def use_letter(letter)
    if !used_letters.include? letter
      used_letters << letter
      return true
    else
      return false
    end
  end
end
