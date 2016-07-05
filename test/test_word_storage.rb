# frozen_string_literal: true
require 'test_helper'
require 'word'

describe WordStorage do
  let(:word_storage) { WordStorage.new }
  it 'inserts a word in storage' do
    word_storage.insert("test")
    word_storage.index.must_equal ["test"]
  end
  it 'indexes all of the Word Storage' do
    word_storage.insert("test")
    word_storage.insert("test2")
    word_storage.index.must_equal %w(test test2)
  end
  it 'gives a random word from the list' do
    word_storage.insert("test")
    word_storage.insert("test2")
    word_storage.index.must_include word_storage.random
  end
end
