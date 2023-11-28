require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  it 'validates presence of name' do
    user.name = nil
    expect(user).not_to be_valid
  end

  it 'has many categories' do
    category1 = create(:category, author: user)
    category2 = create(:category, author: user)

    expect(user.categories).to include(category1, category2)
  end
end