module Blackjack
  class Player
    attr_reader :balance
    attr_accessor :cards, :stand

    def initialize
      @balance = 1000
      @cards = []
      @stand = false
    end

    def score
      aces = 0
      score = cards.reduce(0) do |sum, card|
        case card.value
        when 'A'
          sum += 11
          aces += 1
        when 'K', 'Q', 'J'
          sum += 10
        else
          sum += card.value.to_i
        end

        sum
      end

      while score > 21 && aces > 0
        score -= 10
        aces -= 1
      end

      score
    end

    def bust?
      score > 21
    end
  end
end
