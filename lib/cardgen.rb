require_relative 'card'

class CardGenerator
  attr_reader :cards
  attr_accessor :new_card

  def initialize
    @cards = File.read(ARGV[0])
    @new_card = []
  end

  def to_object
    @cards.each_line do |line|
      @new_card << line.chomp.split(",")
    end
    @cards = @new_card
    end




end
