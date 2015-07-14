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
        build_list(:review, 10, film: film, rating: true)
      end
    end

    factory :bad_film do
      transient do
        reviews_count 10
      end

      after(:create) do |film, evaluator|
        build_list(:review, 10, film: film, rating: false)
      end
    end
  end

end
