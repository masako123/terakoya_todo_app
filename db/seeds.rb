User.delete_all
puts User.count
users = User.create(
    [
        {
            email: "masako@example.com", 
            password: "password",
            username: "Masako"
        },
        {
            email: "bob@example.com",
            password: "password",
            username: "Bob"
        },
        {
            email: "alice@example.com",
            password: "password",
            username: "Alice"
        },
        {
            email: "john@example.com",
            password: "password",
            username: "John"
        },
        {
            email: "tom@example.com", 
            password: "password",
            username: "Tom"
        }
    ]
)
puts User.count