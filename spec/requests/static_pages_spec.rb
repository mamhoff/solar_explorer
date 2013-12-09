require 'spec_helper'


describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Home'" do
      get '/static_pages/home'
      expect(response).to be_success
    end
  end

  describe "admin instruction page" do

    it "should not be viewable by everybody" do
      	get '/static_pages/admin_instructions' 
      	expect(request).to redirect_to(new_user_session_path) 
    end
end

end

