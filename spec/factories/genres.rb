FactoryGirl.define do
  factory :genre do
    name 'Superhero'

    factory :genre_with_films do
      transient do
        films_count 5
      end

      after(:create) do |genre, evaluator|
        create_list(:film, evaluator.films_count, genres: [genre])
      end

    end
  end

end
