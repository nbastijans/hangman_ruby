# frozen_string_literal: true
class Word
  def initialize(word)
    @word = word.upcase.split(//)
  end

  def to_string
    word.join("")
  end

  def letter?(letter)
    word.include? letter
  end

  attr_reader :word
end
