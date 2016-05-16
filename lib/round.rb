require_relative 'deck'
require_relative 'card'
require_relative 'guess'

class Round
  attr_reader :deck
  attr_accessor :guesses, :correct

  def initialize(deck)
    @deck = deck
    @guesses = []
    @correct = 0
  end

  def current_card
    deck.cards[0]
  end

  def record_guess(response)
    @guesses << Guess.new(response, current_card)
    @guesses.last
  end



    #require "pry"; binding.pry



end
