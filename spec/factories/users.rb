FactoryGirl.define do
  factory :user do
    name "traderjoe"
    email  "tj@test.com"
    password "asdfasdf"


    factory :reviewer do
      role "trusted"
    end
  end
end

