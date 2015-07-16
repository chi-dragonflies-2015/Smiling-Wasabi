FactoryGirl.define do
  factory :comment do
    association :user
    content "A visual masterpiece"
    rating  true
    
    factory :filmcomment do
      commentable_type 'film'
      association :commentable, factory: :film

    end

    factory :reviewcomment do
      commentable_type 'review'
      association :commentable, factory: :review
    end
  end

end
