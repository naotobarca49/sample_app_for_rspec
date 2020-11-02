class Task < ApplicationRecord
  belongs_to :owner, class_name: User, foreign_key: :user_id
  validates :title, presence: true, uniqueness: true
  validates :status, presence: true
  enum status: { todo: 0, doing: 1, done: 2 }
end
