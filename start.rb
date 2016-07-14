# frozen_string_literal: true
require_relative "lib/game"
require_relative "lib/word_reader"
require_relative "lib/word"
require_relative "lib/view"

word_storage = WordStorage.new

WordReader.insert_in_storage(word_storage)
word = Word.new word_storage.random
game = Game.new(word)
view = View.new(game)

until game.finished?
  print view.render
  game.guess(gets.chomp.upcase)
end

puts view.render

puts "GEWONNEN!! Das Wort lautet: " + word.to_string if game.won?
puts "VERLOREN!! Das Wort lautet: " + word.to_string if game.lost?
