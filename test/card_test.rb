require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < Minitest::Test

  def test_it_can_make_card
    card = Card.new("What is the capital of Alaska?", "Juneau")
    assert_equal "What is the capital of Alaska?", card.question
    assert_equal "Juneau", card.answer
  end

  def test_it_can_make_another_card
    card = Card.new("What is my name?", "Jason")
    assert_equal "What is my name?", card.question
    assert_equal "Jason", card.answer
  end

end
