FactoryGirl.define do
  factory :user do
    first_name 'John'
    last_name  'Doe'
    email 'tester@system.de'
    password 'user'
    password_confirmation 'user'
  end
end
