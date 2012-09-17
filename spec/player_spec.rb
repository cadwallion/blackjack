require 'spec_helper'

describe Blackjack::Player do
  its(:balance) { should == 1000 }
  its(:cards) { should be_instance_of(Array) }
  its(:cards) { should be_empty }
end
