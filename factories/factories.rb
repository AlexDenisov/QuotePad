FactoryGirl.define do 
  sequence :email do | n |
    "email_#{n}@foo.org"
  end
  sequence :content do | n |
    "Excrpt #{n}"
  end

  factory :role do
  end
  
  factory :user_role, :parent => :role do
    name "User"
  end

  factory :admin_role, :parent => :role do
    name "Admin"
  end

  factory :user do
    email FactoryGirl.generate :email
    password "s3cr3t"
    association :role, :factory => :user_role
  end
  factory :admin, :parent => :user do
    association :role, :factory => :admin_role
  end
  factory :excerpt do
    content FactoryGirl.generate :content
  end
end

