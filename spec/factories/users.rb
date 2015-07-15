FactoryGirl.define do

  factory :user, aliases: [:voter] do
    name "traderjoe"
    email  "tj@test.com"
    password "asdfasdf"


    factory :reviewer do
      role "trusted"
    end
  end

  factory :invalid_user, parent: :user do |f|
     f.password nil
  end
end

