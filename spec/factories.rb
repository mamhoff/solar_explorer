FactoryGirl.define do
  factory :user do
    name     "Martin Meyerhoff"
    email    "martin@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
FactoryGirl.define do
  factory :role do
  	name	"Admin"
  end
end