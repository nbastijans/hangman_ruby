# frozen_string_literal: true
class View
  def initialize(game)
    @game = game
  end

  def render(word)
    system "clear"
    puts "Übrige Versuche: " + game.try.to_s
    puts word.uncovered_word.join
  end

  def get_guess_input
    puts "\n\nEingabe: "
    game.guess(gets.chomp.upcase)
  end

  private

  attr_reader :game
end
