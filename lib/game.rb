# frozen_string_literal: true
require_relative 'word_storage'
# Game Class
class Game
  def initialize(word)
    @word = word
    @attempts = 11
  end

  def guess(letter)
    return if lost? || won?
    reduce_attempts unless word.guess letter
  end

  def finished?
    won? || lost?
  end

  def lost?
    attempts < 1
  end

  def won?
    word.completed?
  end

  attr_reader :word, :attempts

  private

  attr_writer :attempts

  def reduce_attempts
    self.attempts = attempts - 1
    attempts
  end
end
