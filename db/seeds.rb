# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

kenia = User.create!(email: "kenia@example.com", password: "123456")
jasmine = User.create!(email: "jasmine@exmaple.com", password: "123456")

tweets = Tweet.create! (
  [
    { user: kenia, text: "hello, world" },
    { user: kenia , text: "hello, can you hear me?" },
    { user: jasmine, text: "https://www.youtube.com/" },
    { user: jasmine, text: "Lollipop cake cotton candy cookie soufflé candy canes marzipan tiramisu sugar plum. Gummi bears tootsie roll soufflé tart powder pie pudding" }
  ]
)
