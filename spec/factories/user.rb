FactoryGirl.define do

  factory :user do
    # email Faker::Internet.email
    email { |attrs| Faker::Internet.email }
    password 'helloworld'
    password_confirmation 'helloworld'
    #first_name Faker::Name.first_name
    #last_name Faker::Name.last_name
  end
end