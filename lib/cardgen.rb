require_relative 'card'

class CardGenerator
  attr_reader :file
#



  def initialize(filename)
    @file = File.read(filename)
  end

  # Prompt the user to enter a filename for the cards to use. Check whether or not the text file exists. If it does not, prompt the user to enter a new filename.

  def get_file
    p "Do you have a deck you would like to play with?"
    filename = gets.chomp
    if filename.exist? == false
      p "File not found. Please try again"
    end
  end



  #
  # Additionally, allow the user to enter a filename as a command line argument (ie $ ruby flashcards.rb cards.txt). Again, if the file does not exist, return a message and prompt for a new filename.
  #
  def cards
    card_info = @file.split("\n").shuffle
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
