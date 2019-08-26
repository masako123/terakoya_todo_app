class Task < ApplicationRecord
  belongs_to :user
  belongs_to :assignee, :class_name => 'User'
  has_one_attached :image
  before_validation :add_assignee, on: [ :create, :update ]
  enum status: {undone: 0, done: 1}

  # scope :order_by_created_at, -> {order(:created_at)}
  # scope :order_by_due_date_at, -> {order(:due_date_at)}
  # 上２つを下記にまとめる
  scope :order_by, ->(column) {order(column)}

  scope :by_due_date_at, ->(date) {where(due_date_at: date)}
  scope :by_assignee, ->(assignee) {where(assignee: assignee)}
  scope :by_user, ->(user) {where(user: user)}

  def add_assignee 
      self.assignee_id = user_id unless assignee_id?
  end

  def toggle_status
    if undone?
        done!
    else 
        undone!
    end
    # status
  end

  def default_image
    "/task_default_image.png"
  end

end
