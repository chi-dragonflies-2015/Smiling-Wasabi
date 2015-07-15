FactoryGirl.define do
  
  factory :review do
    content "A visual masterpiece"
    rating  true
    film 
    association :user, factory: :reviewer 
  end

end