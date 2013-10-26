FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'password'
    password_confirmation { |u| u.password }
  end

  factory :privileged_session do
    user
  end
end
