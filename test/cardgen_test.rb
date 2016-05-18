require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'
require './lib/deck'
require './lib/round'
require './lib/cardgen'

class CardgenTest < Minitest::Test

  def test_it_can_read_file
    filename = "cards.txt"
    cards = CardGenerator.new(filename)
    assert_equal 9,cards.cards.count
    assert_equal Array, cards.cards.class
  end

  def test_it_can_generate_new_cards
    filename = "cards.txt"
    cards = CardGenerator.new(filename)
    assert_instance_of Card, cards.cards[0]
  end

end
