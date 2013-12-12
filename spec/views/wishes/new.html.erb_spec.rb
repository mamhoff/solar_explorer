require 'spec_helper'

describe "wish/new.html" do
	before { visit new_wish_path }
	it "should return something" do
		expect(page).not_to be_blank
	end

	it "should have the correct title" do
		expect(page).to have_title("Buchen")
	end

	it "should have a headline" do
		expect(page).to have_selector("h1")
		expect(page).to have_content("buchen")
	end
		
	

end