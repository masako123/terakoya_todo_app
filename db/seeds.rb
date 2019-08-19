# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.craete(
    [
        {
            User id: 1, 
            email: "masako@example.com", 
            password: password,
            username: "Masako"
        },
        {
            User id: 2, 
            email: "bob@example.com",
            password: password,
            username: "Bob"
        },
        {
            User id: 3, 
            email: "alice@example.com",
            password: password,
            username: "Alice"
        },
        {
            User id: 4, 
            email: "john@example.com",
            password: password,
            username: "John"
        },
        {
            User id: 5, 
            email: "tom@example.com", 
            password: password,
            username: "Tom"
        }
    ]
)