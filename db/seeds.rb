require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movies = CSV.read('db/seeds.csv', headers: true)
movies = movies.map do |movie| 
  movie['genres'] = movie['genres'].gsub("\"", '').gsub(/[\[\]]/, '')
  movie['genres'] = movie['genres'].split(', ')
  movie
end

genres = []

movies.each { |movie| genres << movie['genres'] }

genres = genres.flatten.uniq

puts "Building Genres"
genres.each { |genre|  FactoryGirl.create(:genre, name: genre) }

puts "Building Reviewers"
200.times do
  FactoryGirl.create(:reviewer, name: Faker::Name.name)
end

reviewers = User.where("role = 'trusted'")

puts "Building Films"
movies.each do |movie|
  genres = movie['genres'].map{ |genre| Genre.find_by(name: genre) }
  if genres && genres.length > 0
    FactoryGirl.create(:film, title: movie['title'], description: movie['plot'], movie_art: movie['poster_url'], genres: genres)
  else
    FactoryGirl.create(:film, title: movie['title'], description: movie['plot'], movie_art: movie['poster_url'])
  end
end

ratings = [true, false]
n = 0

puts "Building 5,000 Reviews and Votes"
Film.all.each do |film|
  reviewers.sample(20).each do |reviewer|
    p n+=1 
    FactoryGirl.create(:review, film: film, user: reviewer, content: Faker::Lorem.paragraphs(rand(4)+1).join(' '), rating: ratings.sample)
    FactoryGirl.create(:vote, voteable: film, voter: reviewer, value: ratings.sample)
  end
end