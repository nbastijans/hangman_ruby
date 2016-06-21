# frozen_string_literal: true
require_relative "lib/game"
require_relative "lib/word_reader"
require_relative "lib/word"

word_storage = WordStorage.new

WordReader.insert_in_storage(word_storage)
# word = Word.new word_storage.random
word = Word.new("testa")
game = Game.new(word)

# ("a".."z").each do |x|
#   game.guess(x)
# end

game.guess("a")
game.guess("a")
game.guess("t")

puts word.word_guess.inspect
puts "Try:  --> " + game.try.to_s
