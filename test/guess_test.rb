require 'testhelper'
require './lib/card'
require './lib/guess'

class GuessTest < Minitest::Test

  def test_it_can_evaluate_guess
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal "Juneau", guess.card.answer
    assert_equal "Juneau", guess.response
    assert guess.correct?
    assert_equal "Correct!", guess.feedback
  end

  def test_it_can_evaluate_another_guess
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Juneau", card)
    assert_equal "Mercury", guess.card.answer
    assert_equal "Juneau", guess.response
    refute guess.correct?
    assert_equal "Incorrect.", guess.feedback
  end

end
