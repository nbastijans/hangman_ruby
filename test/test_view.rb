# frozen_string_literal: true
require 'test_helper'
require 'view'

describe View do
  it 'renders the view for game' do
    game = stub("Game")

    view = View.new(game)

    game.expects(:uncovered_word).returns(%w(_ _ _ _))
    game.expects(:attempts_left).returns(11)
    view.render.must_equal "\033cÜbrige Versuche: 11\n\n____\n\nEingabe: "
  end
end
