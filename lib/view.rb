# frozen_string_literal: true
class View
  class << self
    def render(word, game)
      system "clear"
      puts "Übrige Versuche: " + game.try.to_s
      word.word_guess.each { |a| print a }
    end

    def get_guess_input(game)
      puts "\n\nEingabe: "
      game.guess(gets.chomp.upcase)
    end
  end
end
