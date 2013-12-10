require 'spec_helper'

describe "Static pages" do

  describe "Admin Instructions page" do      
  
    before do # log in an admin
      user = FactoryGirl.create(:user, :admin)
      sign_in(user)
    end
  
    specify do
      visit '/static_pages/admin_instructions'
      expect(page).to have_content('Admin instructions')
    end
    
    it "should have a link to creating a role" do
      visit '/static_pages/admin_instructions'
      expect(page).to have_link("Create Role")
    end
  end
end
