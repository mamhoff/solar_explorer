require 'spec_helper'

describe "Static pages" do

  describe "Boat page" do

    it "should have the content 'Boot'" do
      visit '/static_pages/boat'
      expect(page).to have_content('Boot')
    end
  end
end
