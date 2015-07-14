# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

6.times do
  FactoryGirl.create(:genre, name: Faker::Lorem.word)
end

20.times do
  FactoryGirl.create(:reviewer, name: Faker::Name.name)
end

reviewers = User.where("role = 'trusted'")

Genre.all.each do |genre|
  10.times do
    FactoryGirl.create(:film, title: Faker::Lorem.words(rand(4)+1).join(' '), description: Faker::Lorem.paragraph, movie_art: Faker::Avatar.image, genres: [genre])
  end
end

ratings = [true, false]

Film.all.each do |film|
  reviewers.each do |reviewer|
    FactoryGirl.create(:review, film: film, user: reviewer, content: Faker::Lorem.paragraphs(rand(4)+1).join(' '), rating: ratings.sample)
  end
end