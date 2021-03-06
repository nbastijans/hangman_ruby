# frozen_string_literal: true
class WordStorage
  def initialize
    @words = []
  end

  def insert(word)
    words << word
  end

  def index
    words.dup
  end

  def random
    words.sample
  end

  private

  attr_reader :words
end
