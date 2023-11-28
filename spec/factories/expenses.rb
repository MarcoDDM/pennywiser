FactoryBot.define do
  factory :expense do
    name { 'Marco' }
    amount { 200 }
    user { association(:user) }
    category { association(:category) }
  end
end
