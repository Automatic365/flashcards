require 'testhelper'
require './lib/card'
require './lib/guess'
require './lib/deck'


class DeckTest < Minitest::Test

  def test_it_can_make_a_deck
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west")
    deck = Deck.new([card_1, card_2, card_3])
    assert_equal "Juneau", deck.cards[0].answer
    assert_equal "Mars", deck.cards[1].answer
    assert_equal "North north west", deck.cards[2].answer
    assert_equal 3, deck.count
  end

end
