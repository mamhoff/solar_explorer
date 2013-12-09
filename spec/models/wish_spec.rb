require 'spec_helper'

describe Wish do
  let(:wish) { FactoryGirl.create(:wish) }
  subject { wish }

  it { should respond_to(:fromtime) }
  it { should respond_to(:totime) }
  it { should respond_to(:booking) }

  describe "with an associated booking" do
  	let(:booking) { FactoryGirl.create(:booking) }

  	before do
  		
  		wish.booking = booking
  	end

  	its(:booking) { should eq booking }

  end

end
