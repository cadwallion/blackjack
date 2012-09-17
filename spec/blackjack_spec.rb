require 'spec_helper'

describe Blackjack do
  before do
    Gosu::Image.stub(:new) { }
  end

  describe '#start' do
    it 'should instantiate a new GameWindow' do
      Blackjack::GameWindow.any_instance.should_receive(:show)
      window = Blackjack.start
      Blackjack.window.should == window
      Blackjack::Deck.new
    end
  end
end
