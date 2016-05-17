require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'
require './lib/deck'
require './lib/round'
require './lib/cardgen'

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
    round.record_guess("Juneau")
    assert_instance_of Guess, round.guesses.first
    assert_equal 1, round.guesses.count
  end

  def test_it_can_check_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("Juneau")
    assert_equal "Correct!", round.guesses.first.feedback
  end

  def test_it_can_record_correct_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("Juneau")
    assert_equal "Correct!", round.guesses.first.feedback
    assert_equal 1, round.number_correct
  end

  def test_it_can_record_more_than_one_guess
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("Juneau")
    assert_equal "Correct!", round.guesses.first.feedback
    round.record_guess("100")
    assert_equal "Incorrect.", round.guesses.last.feedback
    assert_equal 2, round.guesses.count
  end

  def current_card_moves_correctly
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("Juneau")
    assert_equal "Correct!", round.guesses.first.feedback
    assert_equal "93,000,000", round.current_card.answer
  end

  def test_it_can_score_round
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("Juneau")
    round.record_guess("100")
    assert_equal 1, round.number_correct
    assert_equal 0.5, round.percent_correct
  end

  def test_it_can_score_another_round
      card_1 = Card.new("What is the capital of Alaska?", "Juneau")
      card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
      card_3 = Card.new("Who is the best player in the NBA?", "Kristaps Porzingis")
      card_4 = Card.new("Who is the MVP of the NBA?", "Steph Curry")
      card_5 = Card.new("Who is the President of the Knicks?", "Phil Jackson")
      deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
      round = Round.new(deck)
      round.record_guess("Juneau")
      round.record_guess("100")
      round.record_guess("Kristaps Porzingis")
      round.record_guess("100")
      round.record_guess("100")
      assert_equal 2, round.number_correct
      assert_equal 0.4, round.percent_correct
  end

  def test_it_can_read_file
    filename = "cards.txt"
    cards = CardGenerator.new(filename)
    assert_equal 5,cards.cards.count
    assert_equal Array, cards.cards.class
  end





end
