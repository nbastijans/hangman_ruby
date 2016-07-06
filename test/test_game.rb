# frozen_string_literal: true
require 'test_helper'
require 'game'
describe Game do
  let(:word) { stub("Word") }
  let(:uncovered_word) { stub("UncoveredWord") }

  it 'checks a right guess' do
    word.expects(:guess).with("A").returns(true)
    word.expects(:completed?).returns(false)
    game = Game.new(word)
    game.guess("A")
    game.try.must_equal 11
  end

  it 'checks a wrong guess' do
    word.expects(:guess).with("A").returns(false)
    word.expects(:completed?).returns(false)
    game = Game.new(word)
    game.guess("A")
    game.try.must_equal 10
  end

  it 'checks for loose' do
    word.stubs(:completed?).returns(false)
    word.stubs(:guess).with("N").returns(false)
    game = Game.new(word)
    game.loose?.must_equal(false)
    11.times do
      game.guess("N")
    end
    game.loose?.must_equal(true)
  end

  it 'checks for win' do
    word.stubs(:completed?).returns(true)
    word.stubs(:guess).with("N").returns(true)
    game = Game.new(word)
    game.win?.must_equal(true)
  end
end
