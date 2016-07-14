# frozen_string_literal: true
class View
  def initialize(game)
    @game = game
  end

  def render
    render_game + output_for_prompt
  end

  private

  attr_reader :game

  def render_game
    "\033cÜbrige Versuche: " + game.attempts_left.to_s +
      "\n\n" + game.uncovered_word.join
  end

  def output_for_prompt
    "\n\nEingabe: "
  end
end
