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
end
