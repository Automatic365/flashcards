require_relative './lib/deck'
require_relative './lib/card'
require_relative './lib/guess'
require_relative './lib/round'
require_relative './lib/cardgen'

    filename = "cards.txt"

    cards = CardGenerator.new(filename).cards
    deck = Deck.new(cards)
    round = Round.new(deck)

    round.start
