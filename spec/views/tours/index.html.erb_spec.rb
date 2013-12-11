require 'spec_helper'

describe "roles/index.html.erb" do
  before do
      FactoryGirl.create(:tour)
      visit tours_path
    end
    
  it "should have the word tour index" do
  	expect(page).to have_content("Tour index")
  end

  it "should not have delete links" do
    expect(page).not_to have_link("delete")
  end

  it "should have links that allow to make a wish" do
    expect(page).to have_link("Buchen")
  end

  describe "signed in as admin" do

    before do 
    admin = FactoryGirl.create(:user, :admin)
      sign_in admin
      visit tours_path
    end

    it "should have one tour" do
      expect(Tour.count).to eq 1
    end
    
    it "should have delete links" do
      expect(page).to have_link("delete")
    end

    it "should have a link to creating a tour" do
      expect(page).to have_link("Create tour")
    end

    describe "clicking a delete link" do
    
    	it "should decrease the role count by 1"	do
    		expect { click_link("delete", match: :first) }.to change(Tour, :count).by(-1)
    	end
  	end
  end
end
