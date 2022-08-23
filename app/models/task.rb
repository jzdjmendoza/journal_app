class Task < ApplicationRecord
  belongs_to :category
  validates :category_id, presence: true
  validates :name, length: { maximum: 20 }, presence: true, uniqueness: true
  validates :description, length: { minimum: 10, maximum: 100 }, presence: true
  validates :deadline, presence:true
end
