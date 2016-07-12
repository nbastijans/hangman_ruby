# frozen_string_literal: true
require 'test_helper'
require 'game'
describe Game do
  let(:word) { stub("Word") }
  let(:uncovered_word) { stub("UncoveredWord") }

  it 'starts with 11 attemptss' do
    game = Game.new(word)
    game.attempts.must_equal 11
  end

  it 'checks a right guess' do
    word.expects(:guess).with("A").returns(true)
    word.expects(:completed?).returns(false)
    game = Game.new(word)
    game.guess("A")
    game.attempts.must_equal 11
  end

  it 'checks a wrong guess' do
    word.expects(:guess).with("A").returns(false)
    word.expects(:completed?).returns(false)
    game = Game.new(word)
    game.guess("A")
    game.attempts.must_equal 10
  end

  it 'checks for lost' do
    word.stubs(:completed?).returns(false)
    word.stubs(:guess).with("N").returns(false)
    game = Game.new(word)
    game.lost?.must_equal(false)
    11.times do
      game.guess("N")
    end
    game.lost?.must_equal(true)
  end

  it 'checks for won' do
    word.stubs(:completed?).returns(true)
    word.stubs(:guess).with("N").returns(true)
    game = Game.new(word)
    game.won?.must_equal(true)
  end

  it 'checks if the game is finished after losing the game' do
    word.stubs(:guess).returns(false)
    word.stubs(:completed?).returns(false)
    game = Game.new(word)
    game.finished?.must_equal(false)
    11.times do
      game.guess("A")
    end
    game.finished?.must_equal(true)
  end

  it 'checks if the game is finished after winning the game' do
    word.stubs(:completed?).returns(true)
    game = Game.new(word)
    game.finished?.must_equal(true)
  end

  it 'checks if the word is initialized correctly' do
    word.stubs(:to_string).returns("TEST")
    game = Game.new(word)
    game.word.to_string.must_equal("TEST")
  end
end
