FactoryGirl.define do
  factory :admin do
    name     "Martin Meyerhoff"
    email    "martin@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end