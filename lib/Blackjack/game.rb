require "blackjack/deck"

module Blackjack
  class Game
    attr_accessor :player, :dealer, :bet_amount, :deck

    def initialize options = {}
      @player = options[:player] || Player.new
      @dealer = options[:dealer] || Player.new

      new_deck
    end

    def new_deck
      @deck = Blackjack::Deck.new
    end

    def deal
      @player.cards = @deck.deal 2     
      @dealer.cards = @deck.deal 2
    end

    def game_over?
      player_bust? || dealer_bust? || player_won?
    end

    def player_bust?

    end
  end
end
