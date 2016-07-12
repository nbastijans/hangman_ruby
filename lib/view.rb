# frozen_string_literal: true
class View
  def initialize(game)
    @game = game
  end

  def render(word)
    render_game(word) + output_for_prompt
  end

  private

  attr_reader :game

  def render_game(word)
    "\033cÜbrige Versuche: " + game.try.to_s +
      "\n\n" + word.uncovered_word.join
  end

  def output_for_prompt
    "\n\nEingabe: "
  end
end
