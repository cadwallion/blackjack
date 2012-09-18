require 'gosu'
require 'ext/gosu/image'
require "blackjack/version"
require "blackjack/player"
require 'blackjack/game'

module Blackjack
  module ZOrder
    Card, UI = *0..3
  end
  
  class GameWindow < Gosu::Window
    attr_reader :font, :background
    def initialize
      super 640, 480, false
      Blackjack.window = self
      
      @font = Gosu::Font.new self, Gosu::default_font_name, 20 
      @background = Gosu::Image.new self, 'lib/blackjack/media/table.bmp', true
      self.caption = 'Blackjack, powered by Gosu'

      @game_in_progress = false
      @start_button = Gosu::Image.new self, 'lib/blackjack/media/start.png', false
      @hit_button   = Gosu::Image.new self, 'lib/blackjack/media/hit.png', false
      @stand_button = Gosu::Image.new self, 'lib/blackjack/media/stand.png', false
      @hidden_card  = Gosu::Image.new self, 'lib/blackjack/media/cards/hidden.png', false
    end

    def update
      if @game
        if @game.game_over?
          @game_in_progress = false
        elsif @game.player.stand && !@game.dealer.stand
          @game.complete_dealer
        end
      end
    end

    def button_down id
      case id
      when Gosu::KbEscape
        close
      when Gosu::MsLeft
        if !@game_in_progress || (@game && @game.game_over?)
          if @start_button.clicked?
            @game = Game.new
            @game.deal
            @game_in_progress = true
          end
        else
          if @hit_button.clicked?
            @game.hit :player
          elsif @stand_button.clicked?
            @game.stand :player
          end
        end
      end
    end

    def draw
      @background.draw 0,0,0

      if @game
        @font.draw "You: #{@game.player.score}", 290, 325, ZOrder::UI, 1.0, 1.0, 0xffffff00

        draw_cards @game.player, 350
        draw_dealer_cards

        if @game.player.stand
          @font.draw "Dealer: #{@game.dealer.score}", 275, 25, ZOrder::UI, 1.0, 1.0, 0xffffff00
        end
      end

      draw_ui_options
      draw_winner
    end

    def draw_dealer_cards
      if @game.player.stand
        draw_cards @game.dealer, 50
      else
        @game.dealer.cards[0].draw 250, 50, ZOrder::Card
        @hidden_card.draw 275, 50, ZOrder::Card
      end
    end

    def draw_cards player, y_coord
      player.cards.each_with_index do |card,index|
        card.draw 250+((index-1) * 25), y_coord, ZOrder::Card
      end
    end

    def draw_ui_options
      if !@game_in_progress || (@game_in_progress && @game.game_over?)
        @start_button.draw 275, 220, ZOrder::UI
      end

      if @game && !@game.game_over?
        @hit_button.draw 425, 375, ZOrder::UI
        @stand_button.draw 545, 375, ZOrder::UI
      end
    end

    def draw_winner
      if @game
        if @game.winner == :push
          title = "PUSH"
        elsif @game.winner == :player
          title = "Player Wins"
        elsif @game.winner == :dealer
          title = "Dealer Wins"
        end
        @font.draw title, 275, 10, ZOrder::UI
      end
    end

    def needs_cursor?
      true
    end
  end

  class << self
    attr_accessor :window
  end

  def self.start
    @window = GameWindow.new
    @window.show
    @window
  end
end
