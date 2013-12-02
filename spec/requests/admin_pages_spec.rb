require 'spec_helper'

describe "Admin pages" do

  subject { page }

  describe "profile page" do
    let(:admin) { FactoryGirl.create(:admin) }
    before { visit admin_path(admin) }

    it { should have_content(admin.name) }
    it { should have_title(admin.name) }
  end
  describe "signup page" do
    before { visit new_admin_path }

    it { should have_content('Administrator sign up') }
    it { should have_title('Administrator sign up') }
  end

  describe "signup" do

    before { visit new_admin_path }

    let(:submit) { "Create new admin" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(Admin, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(Admin, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:admin) { Admin.find_by(email: 'user@example.com') }

        it { should have_title(admin.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      end
    end
  end

end