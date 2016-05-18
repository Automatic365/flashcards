require_relative 'card'

class Guess
  attr_reader :response, :card

  def initialize(response, card)
    @response = response
    @card = card
  end

  def correct?
    if @response == @card.answer
      true
    end
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end

end
