# frozen_string_literal: true
require 'test_helper'
require 'game'
describe Game do
  let(:word) { stub("Word") }
  let(:uncovered_word) { stub("UncoveredWord") }

  it 'checks a right guess' do
    word.expects(:guess).with("A").returns(true)
    word.expects(:uncovered_word).returns(uncovered_word)
    uncovered_word.expects(:include?).returns(true)
    game = Game.new(word)
    game.guess("A")
    game.try.must_equal 11
  end

  it 'checks a wrong guess' do
    word.expects(:guess).with("A").returns(false)
    word.expects(:uncovered_word).returns(uncovered_word)
    uncovered_word.expects(:include?).returns(true)
    game = Game.new(word)
    game.guess("A")
    game.try.must_equal 10
  end
end
