require_relative 'card'

class CardGenerator
  attr_reader :file

  def initialize(filename)
    @file = File.read(filename)
  end

  def cards
    card_info = @file.split("\n").shuffle
    .map do |line|
      line.chomp.split(",")
    end
    card_info.map do |question, answer, hint|
      Card.new(question, answer, hint)
    end
  end

end
