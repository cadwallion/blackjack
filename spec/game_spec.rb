require 'spec_helper'

describe Blackjack::Game do
  its(:deck) { should be_instance_of Blackjack::Deck }

  it 'should shuffle the deck' do
    Blackjack::Deck.any_instance.should_receive(:shuffle).exactly(3).times
    Blackjack::Game.new
  end

  its(:player) { should be_instance_of(Blackjack::Player) }
  its(:dealer) { should be_instance_of(Blackjack::Player) }
end
