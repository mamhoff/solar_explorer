require 'spec_helper'

describe Captain do
  before { @captain = Captain.new(name: "John Doe", email: "address@example.com",
  							password: "foobar", password_confirmation: "foobar") }

	subject { @captain }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
 	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:authenticate) }


  it { should be_valid }

  describe "when captainname is empty" do
  	before { @captain.name = " " }
  	it { should_not be_valid }
	end

	 describe "when email is empty" do
  	before { @captain.email = " " }
  	it { should_not be_valid }
  end

  describe "when name is too long" do
  	before { @captain.name = "a" * 52 }
  	it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[captain@foo,com captain_at_foo.org example.captain@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @captain.email = invalid_address
        expect(@captain).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[captain@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @captain.email = valid_address
        expect(@captain).to be_valid
      end
    end
  end


  describe "when email address is already taken" do
    before do
      captain_with_same_email = @captain.dup
      captain_with_same_email.email = @captain.email.upcase      
      captain_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when password is empty" do
  	before do
  		@captain = Captain.new(name: "John Doe", email: "address@example.com",
  							password: " ", password_confirmation: " ")
  	end
  	it { should_not be_valid }
  end

  describe "password mismatch" do
  	before { @captain.password_confirmation = "mismatch" }
  	it  {should_not be_valid }
  end

  describe "authentication method" do
  	before { @captain.save }
  	let(:found_captain) { Captain.find_by(email: @captain.email) }

  	describe "with valid password" do
  		it { should eq found_captain.authenticate(@captain.password) }
  	end

  	describe "with invalid password" do
  		let(:captain_with_invalid_password) { found_captain.authenticate("invalid") }
  		specify { expect(captain_with_invalid_password).to be_false }
  	end

  end

  describe "with a too short password" do
  	before { @captain.password = @captain.password_confirmation = "a" * 5 }
  	it { should be_invalid }
  end
end 
