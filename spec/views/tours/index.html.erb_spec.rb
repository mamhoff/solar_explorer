require 'spec_helper'

describe "roles/index.html.erb" do
  before do
      5.times { FactoryGirl.create(:tour) }
      visit tours_path
    end
    
  it "should have the word tour index" do
    pp Capybara::default_driver
  	expect(page).to have_content("Tour index")
  end

  it "should not have delete links" do
    expect(page).not_to have_link("delete")
  end

  it "should have links that allow to make a wish" do
    expect(page).to have_link("Buchen")
  end

  it "should not have bootstrap columns without bootstrap rows as parents" do
    expect(page).not_to have_selector(:xpath, \
      "//div[contains(@class, 'col') and parent::*[not(contains(@class, 'row'))]]")
  end

  describe "all the links" do
    # extract the urls from the elements found by "find"
    let(:links) do
      page.all(:xpath, "//div[@class='well']/p/a").map do |link_object|
        link_object[:href]
      end
    end
    
    let(:tournames) { Tour.all.map { |tour| CGI.escape(tour.name) } }

    it "should be exactly as many as there are tours" do
      expect(links.length).to eq tournames.length
    end
    
    it "each tour should have an associated link" do
      result = true
      tournames.each do |tourname|
            result &= links.any? { |link| link[tourname] }
      end
      expect(result).to eq true
    end
  end

  describe "signed in as admin" do

    before do 
    admin = FactoryGirl.create(:user, :admin)
      sign_in admin
      visit tours_path
    end

    it "should have one tour" do
      expect(Tour.count).to eq 5
    end
    
    it "should have delete links" do
      expect(page).to have_link("delete")
    end

    it "should have a link to creating a tour" do
      expect(page).to have_link("Create tour")
    end

    describe "clicking a delete link" do
    
    	it "should decrease the role count by 1"	do
    		expect { click_link("delete", match: :first) }.to change(Tour, :count).by(-1)
    	end
  	end
  end
end
