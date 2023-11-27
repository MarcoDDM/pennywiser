class Expense < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :category, optional: true # Debería ser :category en lugar de :group

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
