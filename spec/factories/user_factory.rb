FactoryGirl.define do
  factory :user do |u|
    u.first_name "John"
    u.last_name  "Doe"
    u.email "tester@system.de"
    u.password "user"
    u.password_confirmation "user"
  end
end