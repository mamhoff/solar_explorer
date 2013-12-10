require 'spec_helper'

describe "roles/index.html.erb" do

	before do
		admin = FactoryGirl.create(:user, :admin)
		sign_in admin
		visit roles_path
	end

  it "should have the word role index" do
  	expect(page).to have_content("Role index")
  end

  it "should have the three standard roles" do
  	expect(page).to have_content("admin")
  	expect(page).to have_content("guide")
  	expect(page).to have_content("captain")
  end

  it "should have delete links" do
  	expect(page).to have_link("delete")
  end

  it "should have a link to creating a role" do
    expect(page).to have_link("Create Role")
  end

  describe "clicking a delete link" do
  
  	it "should decrease the role count by 1"	do
  		expect { click_link("delete", match: :first) }.to change(Role, :count).by(-1)
  	end
	end
end
