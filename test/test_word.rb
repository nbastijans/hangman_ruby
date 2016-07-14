# frozen_string_literal: true
require 'test_helper'
require 'word'

describe Word do
  it 'generates a string out of the word array' do
    word = Word.new("test")
    word.to_string.must_equal "TEST"
  end

  it 'saves the hangman word in an array' do
    word = Word.new("test")
    word.word.must_equal %w(T E S T)
  end

  it 'returns if a letter is included' do
    word = Word.new("test")
    word.letter?("T").must_equal(true)
    word.letter?("X").must_equal(false)
  end
end
