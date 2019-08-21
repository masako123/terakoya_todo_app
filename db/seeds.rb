User.delete_all
puts User.count
Masako = User.create(email: "masako@example.com", password: "password", username: "Masako")
Bob = User.create(email: "bob@example.com", password: "password", username: "Bob")
Alice = User.create(email: "alice@example.com", password: "password", username: "Alice")
John = User.create(email: "john@example.com", password: "password", username: "John")
Tom = User.create(email: "tom@example.com", password: "password", username: "Tom")
puts User.count

Task.delete_all
Workout = Task.create(name: "Go to gym", assignee: Masako, user: Masako) 
Booking = Task.create(name: "Book a hotel", assignee: Bob, user: Masako)
Meeting = Task.create(name: "Make agenda for MTG", assignee: Alice, user: Bob)
Editting = Task.create(name: "Edit todo_application code", assignee: John, user: Tom)
Eamil = Task.create(name: "Email to Mr.Smith", assignee: Masako, user: Tom)
Lunch = Task.create(name: "Lunch meeting", assignee: Masako, user: Alice)
Businesstrip = Task.create(name: "Fix schedule", assignee: Bob, user: John)
Booking2 = Task.create(name: "Book a flight to Fukuoka", assignee: Bob, user: Bob)
Meeting2 = Task.create(name: "Share meeting minutes", assignee: John, user: Alice)
Party = Task.create(name: "Decide venue for opening party", assignee: Tom, user: John)
