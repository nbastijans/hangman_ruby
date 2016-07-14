# frozen_string_literal: true
require 'test_helper'
require 'game'
describe Game do
  let(:word) { stub("Word") }
  let(:uncovered_word) { stub("UncoveredWord") }

  it 'starts with 11 attempts_lefts' do
    game = Game.new(word)
    game.attempts_left.must_equal 11
  end

  it 'checks a right guess' do
    word.stubs(:letter?).with("A").returns(true)
    word.stubs(:word).returns(%w(A B C))
    game = Game.new(word)
    game.guess("A")
    game.attempts_left.must_equal 11
  end

  it 'checks a wrong guess' do
    word.stubs(:letter?).with("A").returns(false)
    word.stubs(:word).returns(%w(B C D))
    game = Game.new(word)
    game.guess("A")
    game.attempts_left.must_equal 10
  end

  it 'returns the game array for the uncovered word' do
    word.stubs(:word).returns(%w(A B C))
    word.stubs(:letter?).with("A").returns(true)
    game = Game.new(word)
    game.guess("A")
    game.uncovered_word.must_equal(%w(A _ _))
  end

  it 'checks for lost' do
    word.stubs(:word).returns(%w(A B C))
    word.stubs(:letter?).with("N").returns(false)
    game = Game.new(word)
    game.lost?.must_equal(false)
    11.times do
      game.guess("N")
    end
    game.lost?.must_equal(true)
  end

  it 'checks for won' do
    word.stubs(:word).returns(%w(A C))
    word.stubs(:letter?).with("A").returns(true)
    word.stubs(:letter?).with("C").returns(true)
    word.stubs(:letter?).with("D").returns(false)
    game = Game.new(word)
    game.won?.must_equal(false)
    game.guess("A")
    game.guess("D")
    game.guess("C")
    game.won?.must_equal(true)
  end

  it 'checks if the game is finished after losing the game' do
    word.stubs(:word).returns(%w(A B C))
    word.stubs(:letter?).with("N").returns(false)
    game = Game.new(word)
    11.times do
      game.guess("N")
    end
    game.finished?.must_equal(true)
  end

  it 'checks if the game is finished after winning the game' do
    word.stubs(:word).returns(%w(A B))
    word.stubs(:letter?).with("A").returns(true)
    word.stubs(:letter?).with("B").returns(true)
    game = Game.new(word)
    game.guess("A")
    game.guess("B")
    game.finished?.must_equal(true)
  end

  it 'checks if the game word is completed' do
    word.stubs(:word).returns(%w(A B))
    word.stubs(:letter?).with("A").returns(true)
    word.stubs(:letter?).with("B").returns(true)
    game = Game.new(word)
    game.completed?.must_equal(false)
    game.guess("A")
    game.guess("B")
    game.completed?.must_equal(true)
  end

  it 'checks if used letters will be saved to array' do
    word.stubs(:word).returns(%w(A B))
    word.stubs(:letter?).with("A").returns(true)
    word.stubs(:letter?).with("X").returns(false)
    game = Game.new(word)
    game.guess("A")
    game.guess("X")
    game.used_letters.must_equal(%w(A X))
  end
end
