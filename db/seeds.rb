# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
List.destroy_all

require "json"
require "open-uri"

url = "http://tmdb.lewagon.com/movie/top_rated"
response = URI.open(url).read
data = JSON.parse(response)


data["results"].each do |element|
  Movie.create! title:  element["title"], overview: element["overview"], poster_url: "https://image.tmdb.org/t/p/w300#{element["poster_path"]}", rating: element["vote_average"]

end
