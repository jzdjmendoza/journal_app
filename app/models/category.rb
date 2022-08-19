class Category < ApplicationRecord
  validates :name, length: { maximum: 20 }, presence: true, uniqueness: true
  validates :description, length: { minimum: 10, maximum: 100 }, presence: true
end
