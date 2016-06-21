# frozen_string_literal: true
require 'test_helper'
require 'word'

describe Word do
  it 'checks if a letter guess was right' do
    word = Word.new("test")
    word.guess("t").must_equal true
  end

  it 'checks if a letter guess was wrong' do
    word = Word.new("test")
    word.guess("i").must_equal false
  end

  it 'builds the game array' do
    word = Word.new("test")
    word.guess("e")
    word.word_guess.must_equal %w(_ e _ _)
  end
end
