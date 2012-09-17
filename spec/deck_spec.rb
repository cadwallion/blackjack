require 'spec_helper'

describe Blackjack::Deck do
  its(:cards) { should have(52).cards }

  describe '#deal' do
    let(:deck) { subject }

    it 'pops the top card off the stack' do
      top_card = deck.cards[-1]
      card = deck.deal
      card.should == top_card
    end

    it 'returns an array of cards if more than 1 specified' do
      cards = deck.deal 4
      cards.should have(4).cards
      deck.should have(48).cards
    end
  end
end
