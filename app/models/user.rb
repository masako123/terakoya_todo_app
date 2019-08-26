class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true, length: { in: 3..15 }
  validates :email, uniqueness: true
  validates :password, length: { in: 6..20 }
  has_many :tasks
  has_many :assigned_tasks, :class_name => 'Task', :foreign_key => 'assignee_id'

  def assigned_tasks
    Task.where(assignee_id: id)
  end

end
