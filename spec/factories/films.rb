FactoryGirl.define do
  factory :film do
    title "Zoolander"
    description "A funny film starring Ben Stiller as a male model."
    movie_art "http://resizing.flixster.com/qLJGPymgNIMnjMyV5RAOyJp8pcI=/180x270/dkpu1ddg7pbsk.cloudfront.net/movie/11/16/89/11168983_ori.jpg"

    factory :good_film do
      transient do
        reviews_count 10
      end

      after(:create) do |film, evaluator|
        create_list(:review, evaluator.reviews_count, film: film)
      end
    end

    factory :bad_film do
      transient do
        reviews_count 10
      end

      after(:create) do |film, evaluator|
        create_list(:review, 10, film: film, rating: 0)
      end
    end
  end

end
