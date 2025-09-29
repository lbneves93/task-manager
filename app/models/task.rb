class Task < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :status, presence: true
  validates :due_date, presence: true
end
