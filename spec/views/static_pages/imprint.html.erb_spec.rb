require 'spec_helper'

describe "Static pages" do

  describe "Imprint" do

    it "should have the content 'Impressum'" do
      visit '/static_pages/imprint'
      expect(page).to have_content('Impressum')
    end
  end
end

