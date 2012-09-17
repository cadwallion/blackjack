module Blackjack
  class Card
    SUITS = %w{Diamonds Hearts Clubs Spades}
    VALUES = ("2".."10").to_a + %w{J Q K A}

    attr_reader :value, :suit, :image

    def initialize value, suit
      @suit = suit
      @value = value
      @image = Gosu::Image.new Blackjack.window, card_path, false
    end

    def card_path
      "lib/blackjack/media/cards/#{value}#{suit[0]}.png"
    end
    
    def to_s
      "#{value}#{suit[0]}"
    end

    def draw(*args)
      @image.draw *args
    end
  end
end
