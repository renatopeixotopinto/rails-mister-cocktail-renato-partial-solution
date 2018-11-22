# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")

# example: https://gist.github.com/kyletcarlson/7911188

# http://ruby-doc.org/stdlib-2.0.0/libdoc/open-uri/rdoc/OpenURI.html
require 'open-uri'
# https://github.com/flori/json
require 'json'
# http://stackoverflow.com/questions/9008847/what-is-difference-between-p-and-pp
require 'pp'

puts 'Starting to seed'
# Construct the URL we'll be calling
request_uri = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
url = '#{request_uri}'

# Actually fetch the contents of the remote URL as a String.
buffer = open(url).read

# Convert the String response into a plain old Ruby array. It is faster and saves you time compared to the standard Ruby libraries too.
result = JSON.parse(buffer)

# Loop through each of the elements in the 'result' Array & print some of their attributes.
result['drinks'].each do |drink|
  Ingredient.create(name: drink['strIngredient1'])
end
puts 'End of seeding'
