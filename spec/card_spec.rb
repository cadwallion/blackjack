require 'spec_helper'

describe Blackjack::Card do
  describe '#initialize' do
    subject { Blackjack::Card.new '4', 'Hearts' }

    its(:value) { should == '4' }
    its(:suit) { should == 'Hearts' }
    its(:image) { should be_instance_of Gosu::Image }
  end
end
