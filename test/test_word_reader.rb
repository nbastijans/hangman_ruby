# frozen_string_literal: true
require 'test_helper'
require 'word_reader'

describe WordReader do
  it 'reads a file and saves it to storage' do
    storage = stub("Storage")
    File.expects(:readlines).with("wordlist.txt").
      returns(%w(a b))
    storage.expects(:insert).with("a")
    storage.expects(:insert).with("b")
    WordReader.insert_in_storage(storage)
  end
end
