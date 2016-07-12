# frozen_string_literal: true
require_relative 'word_storage'
# Game Class
class Game
  def initialize(word)
    @word = word
    @chances = 11
  end

  def guess(letter)
    return if lost? || won?
    reduce_chances unless word.guess letter
  end

  def finished?
    won? || lost?
  end

  def lost?
    chances < 1
  end

  def won?
    word.completed?
  end

  attr_reader :word, :chances

  private

  attr_writer :chances

  def reduce_chances
    self.chances = chances - 1
    chances
  end
end
