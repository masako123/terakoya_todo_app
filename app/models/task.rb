class Task < ApplicationRecord
  belongs_to :user
  belongs_to :assignee, :class_name => 'User'
  has_one_attached :image
  scope :order_by_created_at, -> {order(:created_at)}
  enum status: {undone: 0, done: 1}

  before_validation :add_assignee, on: [ :create, :update ]

  def add_assignee 
      self.assignee_id = user_id unless assignee_id?
  end

  def done
    self.status = 1
  end

  def toggle_status
    if undone?
        done!
    else 
        undone!
    end
    # status
  end

  # def default_image
  #   "/post_default_image.png"
  # end

end
