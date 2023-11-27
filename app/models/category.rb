class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :expenses

  validates :name, presence: true
  validates :icon_link, presence: true
end
