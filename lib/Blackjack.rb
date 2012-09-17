require 'gosu'
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
    end

    def update
      # stub
    end

    def draw
      @background.draw 0,0,0
      @font.draw("Dealer", 275, 25, ZOrder::UI, 1.0, 1.0, 0xffffff00)
      @font.draw("You", 290, 325, ZOrder::UI, 1.0, 1.0, 0xffffff00)
      @font.draw("Balance: #{@player.balance}", 0, 450, ZOrder::UI, 1.0, 1.0, 0xffffff00)
      @player.cards[0].draw 250, 350, ZOrder::Card
      @player.cards[1].draw 275, 350, ZOrder::Card
      @dealer.cards[0].draw 250, 50, ZOrder::Card
      @dealer.cards[1].draw 275, 50, ZOrder::Card
    end

    def button_down id
      if id == Gosu::KbEscape
        close
      end
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
