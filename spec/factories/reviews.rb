FactoryGirl.define do
  
  factory :review do
    content "A visual masterpiece"
    rating  true
    film 
    user  :reviewer
  end

end