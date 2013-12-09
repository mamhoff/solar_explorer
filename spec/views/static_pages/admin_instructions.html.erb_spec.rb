require 'spec_helper'

describe "Static pages" do

  describe "Admin Instructions page" do      
      let(:user) { FactoryGirl.create(:user, :admin) }

      before do
        user.confirmed_at = Time.now
        user.save!
        visit new_user_session_path
        puts new_user_session_path
        fill_in "Email",    with: user.email
        fill_in "Password", with: user.password
        click_button "Sign in"
      visit '/static_pages/admin_instructions'
        
      end
      specify { expect(page).to have_content('Admin instructions') }
     
 
  end
end
