# frozen_string_literal: true
require_relative 'word_storage'
# Game Class
class Game
  def initialize(word)
    @word = word
    @attempts_left = 11
  end

  def guess(letter)
    return if lost? || won?
    reduce_attempts unless word.guess letter
  end

  def finished?
    won? || lost?
  end

  def lost?
    attempts_left < 1
  end

  def won?
    word.completed?
  end

  attr_reader :word, :attempts_left

  private

  attr_writer :attempts_left

  def reduce_attempts
    self.attempts_left = attempts_left - 1
    attempts_left
  end
end
