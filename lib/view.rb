# frozen_string_literal: true
class View
  def initialize(game)
    @game = game
  end

  def render(word)
    "\033cÜbrige Versuche: " + game.try.to_s +
      "\n\n" + word.uncovered_word.join
  end

  def guess_input
    "\n\nEingabe: "
  end

  private

  attr_reader :game
end
