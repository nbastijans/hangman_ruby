# frozen_string_literal: true
require_relative 'word_storage'
require_relative 'word_handler'
class Game
  def initialize(word)
    @word = word
    @try = 11
  end

  def guess(letter)
    if WordHandler.guess(word, letter)
      puts "RICHTIG!"
      return true
    else
      wrong_guess
      puts "LEIDER FALSCH!"
      return false
    end
  end

  def wrong_guess
    if try > 1
      self.try = try - 1
      return try
    else
      return false
    end
  end

  attr_reader :word, :try

  private

  attr_writer :try
end
