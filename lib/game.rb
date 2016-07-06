# frozen_string_literal: true
require_relative 'word_storage'
# Game Class
class Game
  def initialize(word)
    @word = word
    @try = 11
  end

  def guess(letter)
    return if loose? || win?
    reduce_try unless word.guess letter
  end

  def finished?
    win? || loose?
  end

  def loose?
    try < 1
  end

  def win?
    word.completed?
  end

  attr_reader :word, :try

  private

  attr_writer :try

  def reduce_try
    return 0 unless try > 0
    self.try = try - 1
    try
  end
end
