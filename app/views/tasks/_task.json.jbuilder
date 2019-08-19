json.extract! task, :id, :name, :content, :image, :deadline, :assigned_user_id, :user_id, :created_at, :updated_at
json.url task_url(task, format: :json)
