require_relative 'card'

class CardGenerator
  attr_reader :cards
  attr_accessor :new_card

  def initialize
    @cards = File.read(ARGV[0])
    @new_card = []
  end

  def to_object
    #lines = @cards.split("\n")
    @cards.each_line do |line|
      @new_card << line.chomp.split(",")

    end
    @new_card
  end
end

def to_cards


end

gen = CardGenerator.new
gen.cards

require "pry"; binding.pry

1+1
