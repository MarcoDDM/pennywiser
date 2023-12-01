FactoryBot.define do
  factory :user do
    name { 'Nombre de ejemplo' }
    email { 'correo@example.com' }
    password { 'password123' }
  end
end
