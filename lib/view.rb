# frozen_string_literal: true
class View
  def initialize(game)
    @game = game
  end

  def render(word, game)
    system "clear"
    puts "Übrige Versuche: " + game.chances.to_s
    word.uncovered_word.each { |a| print a }
  end

  def get_guess_input(game)
    puts "\n\nEingabe: "
    game.guess(gets.chomp.upcase)
  end

  private

  attr_reader :game
end
