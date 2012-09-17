module Blackjack
  class Player
    attr_reader :balance
    attr_accessor :cards

    def initialize
      @balance = 1000
      @cards = []
    end
  end
end
