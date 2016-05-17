require_relative 'card'

class CardGenerator
  attr_reader :cards, :new_card

  def initialize
    @cards = File.read(ARGV[0])
  end

  def to_object
    card = @cards.split("\n")
    @new_card = card.each_slice(1).to_a
  end
end

def to_cards


end

gen = CardGenerator.new
gen.cards

require "pry"; binding.pry

1+1
