require 'spec_helper'

describe User do
	let(:user) { FactoryGirl.create(:user) }
	subject { user }


	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:encrypted_password)}
	it { should respond_to(:remember_token)}

	it { should be_valid }

	describe "when name is not present" do
		before { user.name = " " }
		it {should_not be_valid}
	end

	describe "when email is not present" do
		before { user.email = " " }
		it {should_not be_valid}
	end

	describe "when username is too long" do
		before { user.name = "a" * 51 }
		it {should_not be_valid}
	end

	describe "when password is not present" do
		let(:user) { User.new(name: "Test Name", email: "test@example.com",
							password: " ", password_confirmation: " ") }
		it { should_not be_valid }
	end

	describe "when password is unequal to confirmation" do
		before { user.password_confirmation = "mismatch"}
		it { should_not be_valid }
	end

	describe "with a password that is too short" do
		before { user.password = user.password_confirmation = "a" * 5 }
		it { should_not be_valid }
	end


	describe "when email is not a valid mail address" do
		invalid_adresses = %w[martin@martin,jp user_at_foo.org useruser@firm.com 
								foo@bar_baz.com foo@bar+baz.com foo@bar..com]
		invalid_adresses.each do |invalid_adress|
			before { user.email = invalid_adress }
			it { should_not be_valid }
		end
	end

	describe "when email is a valid mail address" do
		valid_adresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
		valid_adresses.each do |valid_adress|
			before { user.email = valid_adress }
			it { should be_valid }
		end
	end

   describe "when email address is already taken" do
    let(:second_user) do
      user_with_same_email = user.dup
      user_with_same_email.email.upcase!
      user_with_same_email
    end

    it "is not valid" do
    	second_user.should_not be_valid
    end

   end


   describe "email address with mixed case" do
    let(:mixed_case_email) { "MaRTIn@ExAMPle.CoM" }
      it "should be saved as all lower-case" do
      user.email = mixed_case_email
      user.save
      expect(user.reload.email).to eq mixed_case_email.downcase
    end
  end

  describe "remember token" do
  	before { user.save }
  	its(:remember_token) { should_not be_blank }
  end


end
