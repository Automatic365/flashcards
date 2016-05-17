require_relative 'card'

class CardGenerator
  attr_reader :file


  def initialize(filename)
    @file = File.read(filename)
  end

  def cards
    card_info = @file.split("\n")
                .map do |line|
        line.chomp.split(",")
    end
    card_info.map do |question, answer|
      Card.new(question, answer)
    end
  end




end
#
# gen = CardGenerator.new
#
#   require "pry"; binding.pry
#
#   1+1
