# frozen_string_literal: true
require 'test_helper'
require 'word'

describe Word do
  it 'checks if a letter guess was right' do
    word = Word.new("test")
    word.guess("T").must_equal true
  end

  it 'checks if a letter guess was wrong' do
    word = Word.new("test")
    word.guess("i").must_equal false
  end

  it 'builds the game array' do
    word = Word.new("test")
    word.guess("E")
    word.uncovered_word.must_equal %w(_ E _ _)
  end

  it 'generates a string out of the array' do
    word = Word.new("test")
    word.to_string.must_equal "TEST"
  end

  it 'persists all used letters' do
    word = Word.new("test")
    word.guess("E")
    word.used_letters.must_equal ["E"]
  end

  it 'persists the word' do
    word = Word.new("test")
    word.word.must_equal %w(T E S T)
  end
end
