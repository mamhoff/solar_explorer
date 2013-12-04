require 'spec_helper'

describe Role do
	let(:role) {FactoryGirl.create(:role) }
  	
  	subject { role }

  	it {should respond_to(:name) }

  	it { should respond_to(:users) }

  	describe "it should show a users roles" do
  		let(:user) do
  			user = FactoryGirl.create(:user)
  			user.set_role(role)
  			user.roles
  		end

  		specify { expect(user.roles).to eq [role] }
  	end
end

