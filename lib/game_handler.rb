require_relative 'word'
require_relative 'word_storage'
require_relative 'word_handler'
class Game
  def initialize
    @try = 11
    @word_storage = WordStorage.new
    @word = Word.new(@word_storage.random)
  end

  def guess(letter)
    if (WordHandler.guess(word, letter))
      puts "RICHTIG!"
    else
      wrong_guess
      puts "LEIDER FALSCH!"
    end
  end

  def wrong_guess
    if try > 1 then
      self.try = try - 1
      return try
    else
      return false
    end
  end

  attr_reader :word

  private

  attr_accessor :try
end
