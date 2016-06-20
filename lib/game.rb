# frozen_string_literal: true
require_relative 'word_storage'

class Game
  def initialize(word)
    @word = word
    @try = 50
  end

  def guess(letter)
    wrong_guess if word.used_letter letter
    word.uncover_letter letter if word.has_letter letter
    wrong_guess if !word.has_letter letter
  end

  attr_reader :word, :try

  private

  attr_writer :try

  def wrong_guess
    if try > 1
      self.try = try - 1
      return try
    else
      return false
    end
  end
end
