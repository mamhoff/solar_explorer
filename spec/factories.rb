FactoryGirl.define do
  factory :user do
    name     "Example User"
    email  "user-80@example.com" 
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

    confirmed_at	Time.now
	end

  factory :role do
  	name	"Some name"
  end

	factory :booking do
		captain					nil
		guide 					nil
		boat						nil
		tour						nil 
		customer_name 	"Cutomer 1"
		sequence(:customer_email ) { |n| "customer-#{n}@example.com" }
		contact_info 		"Call us on +1 1234 434"
		notes 					"We are vegans"
		booking_status { FactoryGirl.create(:booking_status, name: "prereserved") }

		trait :with_captain do
			captain { FactoryGirl.create(:user, :captain) }
		end

		trait :with_guide do
			guide { FactoryGirl.create(:user, :guide) }
		end

		trait :with_boat do
			boat { FactoryGirl.create(:boat) }
		end

		trait :with_tour do
			tour { FactoryGirl.create(:tour) } 
		end
	end

	factory :boat do
		name 	"Solar Explorer"
	end

	factory :tour do
		sequence(:name) { |n| "Tour #{n}" }
	end

	factory :booking_status do
		name 	"prereserved"
	end

	factory :wish do
		fromtime	Time.now - 1.days
		totime		Time.now
	end
 
end

