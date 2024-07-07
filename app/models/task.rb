class Task < ApplicationRecord
  belongs_to :user
  enum status: { incomplete: 0, completed: 1 }
  validates :name, presence: true
end
