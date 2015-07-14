FactoryGirl.define do
  factory :user do
    name "traderjoe"
    email  "tj@test.com"
    password "asdfasdf"
  end

  factory :invalid_user, parent: :user do |f|
     f.password nil
  end
end

