FactoryGirl.define do
  factory :user do
    name     "Example User"
    sequence(:email) { |n| "user-#{n}@example.com" }
    password "foobar"
    password_confirmation "foobar"

    trait :admin do
    	before(:create) { |user| user.set_role("Admin") }
    end

    trait :guide do 
    	before(:create) { |user| user.set_role("Guide") }
    end

    trait :captain do 
    	before(:create) { |user| user.set_role("Captain") }
    end
	end

  factory :role do
  	name	"Captain"
  end

	factory :booking do
		captain	{ FactoryGirl.create(:user, :captain) }
		guide 	{ FactoryGirl.create(:user, :guide) }
		boat	{ FactoryGirl.create(:boat) } # these need to be changed later
		tour	{ FactoryGirl.create(:tour) } 
		customer_name "Cutomer 1"
		sequence(:customer_email ) { |n| "customer-#{n}@example.com" }
		contact_info "Call us on +1 1234 434"
		notes "We are vegans"
		booking_status { FactoryGirl.create(:booking_status) }
	end

	factory :boat do
		name 	"Solar Explorer"
	end

	factory :tour do
		name 	"First Tour"
	end

	factory :booking_status do
		name 	"prereserved"
	end
 
end

