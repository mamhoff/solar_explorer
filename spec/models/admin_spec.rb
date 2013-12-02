require 'spec_helper'

describe Admin do
  before { @admin = Admin.new(name: "John Doe", email: "address@example.com",
  							password: "foobar", password_confirmation: "foobar") }

	subject { @admin }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
 	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:authenticate) }


  it { should be_valid }

  describe "when adminname is empty" do
  	before { @admin.name = " " }
  	it { should_not be_valid }
	end

	 describe "when email is empty" do
  	before { @admin.email = " " }
  	it { should_not be_valid }
  end

  describe "when name is too long" do
  	before { @admin.name = "a" * 52 }
  	it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[admin@foo,com admin_at_foo.org example.admin@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @admin.email = invalid_address
        expect(@admin).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[admin@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @admin.email = valid_address
        expect(@admin).to be_valid
      end
    end
  end


  describe "when email address is already taken" do
    before do
      admin_with_same_email = @admin.dup
      admin_with_same_email.email = @admin.email.upcase      
      admin_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when password is empty" do
  	before do
  		@admin = Admin.new(name: "John Doe", email: "address@example.com",
  							password: " ", password_confirmation: " ")
  	end
  	it { should_not be_valid }
  end

  describe "password mismatch" do
  	before { @admin.password_confirmation = "mismatch" }
  	it  {should_not be_valid }
  end

  describe "authentication method" do
  	before { @admin.save }
  	let(:found_admin) { Admin.find_by(email: @admin.email) }

  	describe "with valid password" do
  		it { should eq found_admin.authenticate(@admin.password) }
  	end

  	describe "with invalid password" do
  		let(:admin_with_invalid_password) { found_admin.authenticate("invalid") }
  		specify { expect(admin_with_invalid_password).to be_false }
  	end

  end

  describe "with a too short password" do
  	before { @admin.password = @admin.password_confirmation = "a" * 5 }
  	it { should be_invalid }
  end
end 
