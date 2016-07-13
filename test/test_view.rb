# frozen_string_literal: true
require 'test_helper'
require 'view'

describe View do
  it 'renders the view for game' do
    word = stub("Word")
    game = stub("Game")

    view = View.new(game)

    game.expects(:attempts_left).returns(11)
    word.expects(:uncovered_word).returns(%w(_ _ _ _))
    view.render(word).must_equal "\033cÜbrige Versuche: 11\n\n____\n\nEingabe: "
  end
end
