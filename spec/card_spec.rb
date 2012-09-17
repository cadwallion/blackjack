require 'spec_helper'

describe Blackjack::Card do
  describe '#initialize' do
    subject { Blackjack::Card.new 4, 'H' }

    its(:value) { should == 4 }
    its(:suit) { should == 'H' }
    its(:image) { should be_instance_of Gosu::Image }
  end
end
