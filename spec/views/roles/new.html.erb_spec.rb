require 'spec_helper'

describe "roles/new.html.erb" do
	let(:user) { FactoryGirl.create(:user, :admin)}
	before do 
    user.confirmed_at = Time.now
    user.save!
    sign_in user
    visit new_role_path
	end

	describe "as an admin"	do
	  it "should show a name field" do
	  	expect(page).to have_button("Save role")
	  end

	  describe "with invalid informatino" do

	  	it "should not create a new role" do
		  	expect do 
		  		click_button("Save role")
		  	end.not_to change(Role, :count)
		  end
	  	
	  	describe "after submission" do
				before do
					visit new_role_path
					click_button "Save role"
				end
				specify { expect(page).to have_content('too short') }
			end	
		end

		describe "with valid information" do
		 
		end
	end

	describe "as a non-admin" do
		before do
			user.unset_role("Admin")
			user.save
		end

		specify do
			visit new_role_path
			expect(page).not_to have_button("Save role") 
		end
	end
end
