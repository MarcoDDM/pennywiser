require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:user) { create(:user) }
  let(:category) { create(:category, author: user) }

  it 'is valid with valid attributes' do
    expense = build(:expense, user:, category:)
    expect(expense).to be_valid
  end

  it 'is not valid without a name' do
    expense = build(:expense, user:, category:, name: nil)
    expect(expense).not_to be_valid
  end

  it 'is not valid without an amount' do
    expense = build(:expense, user:, category:, amount: nil)
    expect(expense).not_to be_valid
  end

  it 'is not valid with a negative amount' do
    expense = build(:expense, user:, category:, amount: -10)
    expect(expense).not_to be_valid
  end
end
