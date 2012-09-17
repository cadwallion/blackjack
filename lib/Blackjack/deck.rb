require 'blackjack/card'

module Blackjack
  class Deck
    attr_reader :cards

    def initialize
      @cards = []
      fill
      3.times do
        shuffle
      end
    end

    def fill
      Card::SUITS.each do |suit|
        Card::VALUES.each do |value|
          @cards << Card.new(value, suit)
        end
      end
    end

    def shuffle
      @cards.shuffle!
    end

    def deal count = 1
      cards = []
      count.times do
        cards << @cards.pop
      end

      cards.size > 1 ? cards : cards[0]
    end
  end
end
