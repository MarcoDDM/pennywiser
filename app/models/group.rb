class Group < ApplicationRecord
  has_many :expenses

  validates :name, presence: true
  validates :icon, presence: true
end
