FactoryGirl.define do 
  sequence :email do | n |
    "email_#{n}@foo.org"
  end
  factory :user do
    email FactoryGirl.generate :email
    password "s3cr3t"
  end
end

