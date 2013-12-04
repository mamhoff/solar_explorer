require 'spec_helper'

describe Role do
	let(:role) {FactoryGirl.create(:role) }
  	
  	subject { role }

  	it {should respond_to(:name) }

  	it { should respond_to(:users) }

  	describe "it should show a users roles" do
  		let(:user_id) do
  			user = FactoryGirl.create(:user)
  			user.roles << role
  			user.save
  			user.id
  		end

  		specify { expect(User.find(user_id).roles).to eq [role] }
  	end
end

