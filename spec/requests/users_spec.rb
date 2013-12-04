require 'spec_helper'

describe "Users" do
  describe "GET /users/1" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get user_path(User.first)
      response.status.should be(200)
    end
  end
end
