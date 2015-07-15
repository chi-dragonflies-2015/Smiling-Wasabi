FactoryGirl.define do
  
  factory :review do
    content "A visual masterpiece"
    rating  true
    film 
    association :user, factory: :reviewer 

    factory :popular_review do
      transient do
        vote_count 10
      end

      after(:create) do |review, evaluator|
        create_list(:vote, 10, voteable: review, value: 1)
      end
    end

    factory :unpopular_review do
      transient do
        vote_count 10
      end

      after(:create) do |review, evaluator|
        create_list(:vote, 10, voteable: review, value: 0)
      end
    end
  end

end