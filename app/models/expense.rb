class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :group, optional: true

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
