# frozen_string_literal: true
require_relative 'word_storage'
# Game Class
class Game
  def initialize(word)
    @word = word
    @attempts_left = 11
    @used_letters = []
  end

  def guess(letter)
    return if finished?
    reduce_attempts unless use_letter letter
  end

  def uncovered_word
    uncovered = []
    word.word.each.with_index do |value, index|
      uncovered[index] = "_" unless used_letters.include? value
      uncovered[index] = value if used_letters.include? value
    end
    uncovered
  end

  def finished?
    won? || lost?
  end

  def lost?
    attempts_left < 1
  end

  def won?
    completed?
  end

  def completed?
    return true if uncovered_word == word.word
    false
  end

  attr_reader :word, :attempts_left, :used_letters

  private

  attr_writer :attempts_left

  def use_letter(letter)
    used_letters << letter unless used_letter(letter)
    return false unless word.letter?(letter)
    true
  end

  def used_letter(letter)
    used_letters.include? letter
  end

  def reduce_attempts
    self.attempts_left = attempts_left - 1
    attempts_left
  end
end
