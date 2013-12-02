require 'spec_helper'

describe Guide do
  before { @guide = Guide.new(name: "John Doe", email: "address@example.com",
  							password: "foobar", password_confirmation: "foobar") }

	subject { @guide }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
 	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:authenticate) }


  it { should be_valid }

  describe "when guidename is empty" do
  	before { @guide.name = " " }
  	it { should_not be_valid }
	end

	 describe "when email is empty" do
  	before { @guide.email = " " }
  	it { should_not be_valid }
  end

  describe "when name is too long" do
  	before { @guide.name = "a" * 52 }
  	it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[guide@foo,com guide_at_foo.org example.guide@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @guide.email = invalid_address
        expect(@guide).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[guide@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @guide.email = valid_address
        expect(@guide).to be_valid
      end
    end
  end


  describe "when email address is already taken" do
    before do
      guide_with_same_email = @guide.dup
      guide_with_same_email.email = @guide.email.upcase      
      guide_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when password is empty" do
  	before do
  		@guide = Guide.new(name: "John Doe", email: "address@example.com",
  							password: " ", password_confirmation: " ")
  	end
  	it { should_not be_valid }
  end

  describe "password mismatch" do
  	before { @guide.password_confirmation = "mismatch" }
  	it  {should_not be_valid }
  end

  describe "authentication method" do
  	before { @guide.save }
  	let(:found_guide) { Guide.find_by(email: @guide.email) }

  	describe "with valid password" do
  		it { should eq found_guide.authenticate(@guide.password) }
  	end

  	describe "with invalid password" do
  		let(:guide_with_invalid_password) { found_guide.authenticate("invalid") }
  		specify { expect(guide_with_invalid_password).to be_false }
  	end

  end

  describe "with a too short password" do
  	before { @guide.password = @guide.password_confirmation = "a" * 5 }
  	it { should be_invalid }
  end
end 
