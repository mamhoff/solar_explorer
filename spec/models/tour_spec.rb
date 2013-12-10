require 'spec_helper'

describe Tour do
  let(:tour) { FactoryGirl.create(:tour) }

  subject { tour }

  it { should respond_to(:name) }

  it { should be_valid }

describe "when name is not present" do
	before { tour.name = " " }
	it {should_not be_valid}
end

 
end
