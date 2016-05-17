require_relative 'deck'
require_relative 'card'
require_relative 'guess'

class Round
  attr_reader :deck
  attr_accessor :guesses, :number_correct

  def initialize(deck)
    @deck = deck
    @guesses = []
    @number_correct = 0
  end

  def current_card
    deck.cards[@guesses.count]
  end

  def record_guess(response)
    @number_correct += 1 if response == current_card.answer
    @guesses << Guess.new(response, current_card)
    p guesses.last.feedback
  end

  def percent_correct
    percent = @number_correct / @guesses.count.to_f
    percent.to_f
  end

  def start
    p "Welcome! You are playing with #{deck.count} cards"
    p "----------------------------------------------------"
    while current_card != nil
      card_update = "This is card #{guesses.count + 1} out of #{deck.count}"
    p card_update
    p current_card.question
    repl_response
  end
  p "****** Game over! ******"
  p "You had #{number_correct} correct guesses out of #{guesses.count} for a score of #{(percent_correct * 100).to_i}%."
  end

  def repl_response
    record_guess(gets.chomp)
    @guesses.last.feedback
  end




end
