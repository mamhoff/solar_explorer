require 'spec_helper'

describe Booking do
	let(:booking) { FactoryGirl.create(:booking) }
	subject { booking }
	it { should respond_to(:id) }
	it { should respond_to(:captain) }
	it { should respond_to(:guide) }

	describe "captain association" do
		it "should give us the captain's name" do
			expect(booking.captain.name).to eq FactoryGirl.create(:user).name
		end
	end

end
