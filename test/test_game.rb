# frozen_string_literal: true
require 'test_helper'
require 'game'
describe Game do
  let(:word) { stub("Word") }

  it 'checks a right guess' do
    WordHandler.expects(:guess).with(word, "a").returns(true)
    game = Game.new(word)
    game.guess("a").must_equal true
  end

  it 'checks a wrong guess' do
    WordHandler.expects(:guess).with(word, "b").returns(false)
    game = Game.new(word)
    game.guess("b").must_equal false
  end

  it 'reduces the amount of try if there is a try left' do
    game = Game.new(word)
    game.try.must_equal 11
    game.wrong_guess
    game.try.must_equal 10
    9.times do
      game.wrong_guess
    end
    game.wrong_guess.must_equal false
  end

  it 'has a public reader for the word' do
    game = Game.new(word)
    game.word.must_equal word
  end
end
