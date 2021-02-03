Movie.all.destroy_all
100.times do |m|
  Movie.create(name: Faker::Movie.unique.title, year: rand(1900..2020) , genre: ["action", "horreur", "comédie", "drame"].sample , synopsis: Faker::Movie.quote , director: Faker::Name.name , allocine_rating: rand(0.0..5.0).round(1) , my_rating: nil , already_seen: false)
end