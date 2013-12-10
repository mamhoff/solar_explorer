require 'spec_helper'

describe Role do
	let(:role) {Role.find_by(name: "admin") }
  	
  	subject { role }

  	it { should respond_to(:name) }

  	it { should respond_to(:users) }

  	describe "it should show a users roles" do
  		let(:user_id) do
  			user = FactoryGirl.create(:user, :admin)
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

    it "cannot have a blank name" do
      role.name = " "
      expect(role).not_to be_valid
    end

    it "cannot be a duplicate (case insensitive)" do
      role2 = Role.create(name: "AdMiN")
      expect(role2).not_to be_valid
    end

end		

