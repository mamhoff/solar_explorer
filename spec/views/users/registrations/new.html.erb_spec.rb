require 'spec_helper'

describe "Sign-Up page" do
	
	it "should have a title" do
		visit new_user_registration_path
		expect(page).to have_title('Sign in')
	end

	it "should have an input box for name" do
		visit new_user_registration_path
		expect(page).to have_selector('#user_name')
	end

  describe "signup" do

    before { visit new_user_registration_path }

    let(:submit) { "Sign up" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Password confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end	
	
end
