# frozen_string_literal: true
require 'test_helper'
require 'word'

describe Word do
  it 'adds a used letter which is not used before' do
    word = Word.new("test")
    word.use_letter("t").must_equal true
  end

  it 'tries to add a used letter' do
    word = Word.new("test")
    word.use_letter("t").must_equal true
    word.use_letter("t").must_equal false
  end

  it 'splits the word into a char array' do
    word = Word.new("test")
    word.word.must_equal %w(t e s t)
  end
end
