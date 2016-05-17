require_relative './lib/deck'
require_relative './lib/card'
require_relative './lib/guess'
require_relative './lib/round'

card_1 = Card.new("What is the capital of Alaska?", "Juneau")
card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
card_3 = Card.new("Who is the best player in the NBA?", "Kristaps Porzingis")
card_4 = Card.new("Who is the MVP of the NBA?", "Steph Curry")
card_5 = Card.new("Who is the President of the Knicks?", "Phil Jackson")
deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
round = Round.new(deck)

round.start
