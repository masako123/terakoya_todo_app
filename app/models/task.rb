class Task < ApplicationRecord
  belongs_to :user
  belongs_to :assignee, :class_name => 'User'
  has_one_attached :image
  scope :order_by_created_at, -> {order(:created_at)}
end
