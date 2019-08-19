Taskモデルの追加
rails g scaffold Task name content:text image deadline:datetime assigned_user_id:integer user:references