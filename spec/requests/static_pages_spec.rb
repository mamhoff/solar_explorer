require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Home'" do
      get '/static_pages/home'
      expect(response).to be_success
    end
  end
end
