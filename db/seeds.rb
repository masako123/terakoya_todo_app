User.delete_all
puts User.count
Masako = User.create(email: "masako@example.com", password: "password", username: "Masako")
Bob = User.create(email: "bob@example.com", password: "password", username: "Bob")
Alice = User.create(email: "alice@example.com", password: "password", username: "Alice")
John = User.create(email: "john@example.com", password: "password", username: "John")
Tom = User.create(email: "tom@example.com", password: "password", username: "Tom")
puts User.count

Workout = Task.create(name: "Go to gym", assignee_id: 1, user_id: 1)
Booking = Task.create(name: "Book hotel", assignee_id: 2, user_id: 1)
Meeting = Task.create(name: "Make agenda for MTG", assignee_id: 3, user_id: 2)
Editting = Task.create(name: "Edit todo application code", assignee_id: 4, user_id: 5)


