require "blackjack/deck"

module Blackjack
  class Game
    attr_accessor :player, :dealer, :bet_amount, :deck

    def initialize options = {}
      @player = options[:player] || Player.new
      @dealer = options[:dealer] || Player.new
      @player_stand = false

      @deck = Blackjack::Deck.new
    end

    def deal
      @player.cards = @deck.deal 2     
      @dealer.cards = @deck.deal 2
    end

    def game_over?
      if @player.score == 21 && @player.cards.size == 2
        true
      elsif (@player.stand && @dealer.stand) || @player.bust? || @dealer.bust?
        true
      else
        false
      end
    end

    def winner
      if game_over?
        winner = :dealer
        if dealer.bust? || (player.score > dealer.score && !player.bust?)
          winner = :player
        elsif player.score == dealer.score
          winner = :push
        end
        winner
      else
        nil
      end
    end

    def hit target
      target_person = send target
      target_person.cards << @deck.deal
      stand(target) if target_person.score > 21
    end

    def stand target
      target_person = send target
      target_person.stand = true
    end

    def complete_dealer
      while @dealer.score < 16
        hit :dealer
      end
      stand :dealer
    end
  end
end
