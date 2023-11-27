class AddIconLinkToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :icon_link, :string
  end
end
