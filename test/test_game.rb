# frozen_string_literal: true
require 'test_helper'
require 'game'
describe Game do
  let(:word) { stub("Word") }
  let(:word_guess) { stub }

  it 'checks a right guess' do
    word.expects(:guess).with("a").returns(true)
    word.expects(:word_guess).returns(word_guess)
    word_guess.expects(:include?).returns(true)
    game = Game.new(word)
    game.guess("a")
    game.try.must_equal 11
  end

  it 'checks a wrong guess' do
    word.expects(:guess).with("a").returns(false)
    word.expects(:word_guess).returns(word_guess)
    word_guess.expects(:include?).returns(true)
    game = Game.new(word)
    game.guess("a")
    game.try.must_equal 10
  end
end
