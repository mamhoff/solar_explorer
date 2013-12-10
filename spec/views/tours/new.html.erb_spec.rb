require 'spec_helper'

describe "tours/new.html.erb" do
	let(:user) { FactoryGirl.create(:user, :admin)}
	before do 
    sign_in user
    visit new_tour_path
	end

	describe "as an admin"	do
	  it "should show a name field" do
	  	expect(page).to have_button("Save tour")
	  end

	  describe "with invalid informatino" do

	  	it "should not create a new tour" do
		  	expect do 
		  		click_button("Save tour")
		  	end.not_to change(Tour, :count)
		  end
	  	
	  	describe "after submission" do
				before do
					visit new_tour_path
					click_button "Save tour"
				end
				specify { expect(page).to have_content('too short') }
			end	
		end

		describe "with valid information" do
			before do
				visit new_tour_path
				fill_in "Name", with: "New tour"
			end

			specify do
					expect do
					click_button "Save tour"
				end.to change(Tour, :count).by(1)
			end
		 
		end
	end

	describe "as a non-admin" do
		before do
			user.unset_role("Admin")
			user.save
		end

		specify do
			visit new_tour_path
			expect(page).not_to have_button("Save tour") 
		end
	end
end
