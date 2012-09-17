require 'spec_helper'

describe Blackjack::Game do
  let(:game) { subject }
  its(:deck) { should be_instance_of Blackjack::Deck }
  its(:player) { should be_instance_of(Blackjack::Player) }
  its(:dealer) { should be_instance_of(Blackjack::Player) }

  it 'should shuffle the deck' do
    Blackjack::Deck.any_instance.should_receive(:shuffle).exactly(3).times
    Blackjack::Game.new
  end

  describe '#hit' do
    it 'deals a card to the target player' do
      game.hit :player
      game.player.should have(1).cards
    end

    it 'stands player if bust' do
      game.player.cards << Blackjack::Card.new('K', 'Hearts')
      game.player.cards << Blackjack::Card.new('K', 'Diamonds')
      game.player.cards << Blackjack::Card.new('A', 'Hearts')
      game.hit :player
      game.player.score.should > 21
      game.player.stand.should be_true
    end
  end

  describe '#stand' do
    it 'sets the player to stand pat' do
      game.stand :player
      game.player.stand.should be_true
    end
  end

  describe '#complete_dealer' do
    it 'gives the dealer cards until score exceeds 15' do
      game.complete_dealer
      game.dealer.score.should > 15
    end

    it 'stands the dealer pat' do
      game.complete_dealer
      game.dealer.stand.should be_true
    end
  end

  describe '#winner' do
    context 'game is over' do
      before do
        game.player.stand = true
        game.dealer.stand = true
      end

      it 'returns dealer if player busts' do
        game.player.stub(:score) { 24 }
        game.winner.should == :dealer
      end

      it 'returns dealer if player has lower score than dealer' do
        game.player.stub(:score) { 17 }
        game.dealer.stub(:score) { 20 }
        game.winner.should == :dealer
      end

      it 'returns player if dealer busts' do
        game.player.stub(:score) { 11 }
        game.dealer.stub(:score) { 24 }
        game.winner.should == :player
      end

      it 'returns player if player has higher score than dealer' do
        game.player.stub(:score) { 20 }
        game.dealer.stub(:score) { 19 }
        game.winner.should == :player
      end

      it 'returns player if player has blackjack' do
        game.player.stub(:score) { 21 }
        game.winner.should == :player
      end

      it 'returns push if both scores are equal' do
        game.player.stub(:score) { 17 }
        game.dealer.stub(:score) { 17 }
        game.winner.should == :push
      end
    end
    
    context 'game is not over' do
      it 'returns nil' do
        game.winner.should be_nil
      end
    end
  end
end
