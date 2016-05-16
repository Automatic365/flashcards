require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'
require './lib/deck'
require './lib/round'

class FlashcardTest < Minitest::Test

  def test_it_can_make_card
    card = Card.new("What is the capital of Alaska?", "Juneau")
    assert_equal "What is the capital of Alaska?", card.question
    assert_equal "Juneau", card.answer
  end

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

  def test_it_can_make_a_deck
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal 2, round.deck.count
  end

  def test_it_has_guess_array
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal [], round.guesses
  end

  def test_it_can_show_current_card
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_instance_of Card, round.current_card
  end

  def test_it_can_store_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_instance_of Guess, round.record_guess("Juneau")
    assert_equal 1, round.guesses.count
  end

  def test_it_can_check_guesses
    #assert_equal "Correct!", round.guesses.first.feedback
    # => "Correct!"
    # round.number_correct
    # => 1
    # round.current_card
    # => #<Card:0x007ffdf1820a90 @answer="93,000,000", @question="Approximately how many miles are in one astronomical unit?">
    # round.record_guess("2")
    # => #<Guess:0x007ffdf19c8a00 @card=#<Card:0x007ffdf1820a90 @answer="93,000,000", @question="Approximately how many miles are in one astronomical unit?">, @response="2">
    # round.guesses.count
    # => 2
    # round.guesses.last.feedback
    # => "Incorrect."
    # round.number_correct
    # => 1
    # round.percent_correct
    # => 50






end
