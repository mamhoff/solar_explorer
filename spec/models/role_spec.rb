require 'spec_helper'

describe Role do
	let(:role) {FactoryGirl.create(:role) }
  	
  	subject { role }

  	it { should respond_to(:name) }

  	it { should respond_to(:users) }

  	describe "it should show a users roles" do
  		let(:user_id) do
  			user = FactoryGirl.create(:user)
  			user.set_role(role.name)
  			user.save
  			user.id
  		end

  		specify { expect(User.find(user_id).roles).to eq [role] }
  		specify { expect(role.users).to eq [User.find(user_id)] }
  	end

  	describe "creating a role with a name that already exists" do
  		let(:duplicate_role) {Role.new(name: role.name)}
  		specify { expect(duplicate_role).not_to be_valid }
  	end

end		

