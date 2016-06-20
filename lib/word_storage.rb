class WordStorage
  def initialize
    @words = []
  end

  def insert(word)
    words << word
  end

  def index
    words
  end

  def length
    words.length
  end

  private

  attr_accessor :word
end
