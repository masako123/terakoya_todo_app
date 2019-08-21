class Task < ApplicationRecord
  belongs_to :user
  belongs_to :assignee, :class_name => 'User'
  has_one_attached :image
  scope :order_by_created_at, -> {order(:created_at)}

  before_validation :add_assignee, on: [ :create, :update ]

  def add_assignee 
      self.assignee_id = user_id unless assignee_id?
  end

  def done
    binding.pry

  end

end
