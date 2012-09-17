require 'spec_helper'

describe Blackjack::GameWindow do
  describe '#initialize' do
    it 'sets the window to itself' do
      window = Blackjack::GameWindow.new
      Blackjack.window.should == window
    end
    
    it 'creates a font instance' do
      #Gosu::Font.should_receive(:new)
      window = Blackjack::GameWindow.new
      window.font.should be_instance_of Gosu::Font
    end
  end
end
