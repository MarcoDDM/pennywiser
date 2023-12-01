require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { create(:user) }

  it 'is valid with valid attributes' do
    category = build(:category, author: user)
    expect(category).to be_valid
  end

  it 'is not valid without a name' do
    category = build(:category, author: user, name: nil)
    expect(category).not_to be_valid
  end

  it 'is not valid without an icon_link' do
    category = build(:category, author: user, icon_link: nil)
    expect(category).not_to be_valid
  end
end
