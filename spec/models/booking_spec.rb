require 'spec_helper'

describe Booking do
	let(:booking) { FactoryGirl.create(:booking) }
	subject { booking }
	it { should respond_to(:id) }
	it { should respond_to(:captain) }
	it { should respond_to(:guide) }
	it { should respond_to(:tour) }
	it { should respond_to(:booking_status) }
	it { should respond_to(:created_at) }
	it { should respond_to(:updated_at) }
	it { should respond_to(:customer_name) }
	it { should respond_to(:customer_email) }
	it { should respond_to(:contact_info) }
	it { should respond_to(:notes) }

	describe "captain association" do
		it "no captain is alright" do
			booking.captain = nil
			booking.save!		
			expect(booking.captain).to eq nil
		end
	end

	

end
