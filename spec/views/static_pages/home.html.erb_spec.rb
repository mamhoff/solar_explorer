require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Hauptseite'" do
      visit '/static_pages/home'
      expect(page).to have_content('Hauptseite')
    end

    it "should have a Sign-up link" do
     visit root_path
     expect(page).to have_link('Sign up')
  	end

  	it "should have a Sign-in link" do
  		visit root_path
  		expect(page).to have_link('Sign in')
  	end
  end
end


