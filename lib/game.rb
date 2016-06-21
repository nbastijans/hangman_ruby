# frozen_string_literal: true
require_relative 'word_storage'

class Game
  def initialize(word)
    @word = word
    @try = 11
  end

  def guess(letter)
    unless loose?
      reduce_try unless word.guess letter
    end
  end

  def loose?
    try < 1
  end

  def win?
    !word.word_guess.include? "_"
  end

  attr_reader :word, :try

  private

  attr_writer :try

  def reduce_try
    if try > 0
      self.try = try - 1
      try
    end
  end
end
