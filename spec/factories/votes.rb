FactoryGirl.define do
  factory :vote do
    association :voter, factory: :user
    value 1
    factory :filmvote do
      voteable_type 'film'
      association :voteable, factory: :film

    end

    factory :reviewvote do
      voteable_type 'review'
      association :voteable, factory: :review
    end
  end

end
