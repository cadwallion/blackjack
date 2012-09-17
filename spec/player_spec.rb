require 'spec_helper'

describe Blackjack::Player do
  let(:player) { subject }

  its(:balance) { should == 1000 }
  its(:cards) { should be_instance_of(Array) }
  its(:cards) { should be_empty }
  its(:score) { should == 0 }

  describe '#score' do
    it 'returns the sum of the cards' do
      player.cards << Blackjack::Card.new('4', 'Hearts')
      player.cards << Blackjack::Card.new('K', 'Hearts')
      player.score.should == 14
    end
  end

  describe '#bust?' do
    it 'returns true if score is over 21' do
      player.stub(:score) { 24 }
      player.bust?.should be_true
    end

    it 'return false if score is less than or equal to 21' do
      player.stub(:score) { 21 }
      player.bust?.should be_false
    end
  end
end
