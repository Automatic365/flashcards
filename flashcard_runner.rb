require_relative './lib/deck'
require_relative './lib/card'
require_relative './lib/guess'
require_relative './lib/round'
require_relative './lib/cardgen'

filename = ARGV[0]
cards = CardGenerator.new
cards.to_object

# card_1 = Card.new("What is the best bar on Blake St?", "The Vault")
# card_2 = Card.new("Who won the 2016 NCAA National Championship?", "Villanova")
# card_3 = Card.new("Who is the best player in the NBA?", "Kristaps Porzingis")
# card_4 = Card.new("Who is the President of the Knicks?", "Phil Jackson")
# card_5 = Card.new("Clear eyes, full hearts?", "Can't Lose")
deck = Deck.new(cards)
round = Round.new(deck)

round.start
