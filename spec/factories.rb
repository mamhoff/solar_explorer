FactoryGirl.define do
  factory :user do
    name     "Martin Meyerhoff"
    email    "martin@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end