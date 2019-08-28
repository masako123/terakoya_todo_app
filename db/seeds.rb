User.delete_all
puts User.count
Masako = User.create(email: "masako@example.com", password: "password", username: "Masako")
Bob = User.create(email: "bob@example.com", password: "password", username: "Bob")
Alice = User.create(email: "alice@example.com", password: "password", username: "Alice")
John = User.create(email: "john@example.com", password: "password", username: "John")
Tom = User.create(email: "tom@example.com", password: "password", username: "Tom")
puts User.count


Task.delete_all
Workout = Task.create(name: "Go to gym", assignee: Masako, user: Masako, created_at: 1.days.ago, due_date_at: 1.days.from_now, status: :done) 
Booking = Task.create(name: "Book a hotel", assignee: Bob, user: Masako, created_at: 13.days.ago, due_date_at: 3.days.from_now)
Meeting = Task.create(name: "Make agenda for MTG", assignee: Alice, user: Bob, created_at: 13.days.ago, due_date_at: 5.days.from_now)
Editting = Task.create(name: "Edit todo_application code", assignee: John, user: Tom, created_at: 13.days.ago, due_date_at: 7.days.from_now)
Eamil = Task.create(name: "Email to Mr.Smith", assignee: Masako, user: Tom, created_at: 3.days.ago, due_date_at: 2.days.from_now)
Lunch = Task.create(name: "Lunch meeting", assignee: Masako, user: Alice, created_at: 7.days.ago, due_date_at: 6.days.from_now)
Businesstrip = Task.create(name: "Fix schedule", assignee: Bob, user: John, created_at: 7.days.ago, due_date_at: 10.days.from_now)
Booking2 = Task.create(name: "Book a flight to Fukuoka", assignee: Bob, user: Bob, created_at: 5.days.ago, due_date_at: 3.days.from_now)
Meeting2 = Task.create(name: "Share meeting minutes", assignee: John, user: Alice, created_at: 5.days.ago, due_date_at: 2.days.from_now)
Party = Task.create(name: "Decide venue for opening party", assignee: Tom, user: John, created_at: 15.days.ago, due_date_at: 1.days.from_now)

# Taskを登録日順に並べる
# Task.order_by_created_at.pluck(:created_at, :id)
#=>  
# [[Tue, 06 Aug 2019 07:26:35 UTC +00:00, 10],
#  [Thu, 08 Aug 2019 07:26:35 UTC +00:00, 2],
#  [Thu, 08 Aug 2019 07:26:35 UTC +00:00, 3],
#  [Thu, 08 Aug 2019 07:26:35 UTC +00:00, 4],
#  [Wed, 14 Aug 2019 07:26:35 UTC +00:00, 6],
#  [Wed, 14 Aug 2019 07:26:35 UTC +00:00, 7],
#  [Fri, 16 Aug 2019 07:26:35 UTC +00:00, 8],
#  [Fri, 16 Aug 2019 07:26:35 UTC +00:00, 9],
#  [Sun, 18 Aug 2019 07:26:35 UTC +00:00, 5],
#  [Tue, 20 Aug 2019 07:26:35 UTC +00:00, 1]]


# Taskをdue_date_at（締切日）ごとに表示する
# Task.by_due_date_at("2019/08/22").pluck(:due_date_at).uniq[0] 
#=> Thu, 22 Aug 2019

# Taskをassignee（担当者）ごとに表示する
# target_user = User.first
# Task.by_assginee(target_user).pluck(:assignee_id).uniq[0] == target_user.id
# => true

# Taskをuser（登録者）ごとに表示する
# user = User.first
# Task.by_user(user).pluck(:user_id).uniq[0] == user.id
#=> true

# ログインしているUserが自分が登録したタスク一覧を表示する
# user = User.first
# user.assigned_tasks.pluck(:user_id).uniq[0] == user.id
#=> true

# Doneしたタスク
