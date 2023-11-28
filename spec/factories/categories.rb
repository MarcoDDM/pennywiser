FactoryBot.define do
  factory :category do
    name { 'Tech' }
    icon_link { 'https://www.example.com/imagen.jpg' } # Ejemplo de URL de imagen en línea
    author { association(:user) } # Asociamos la categoría con un usuario utilizando la factory :user
  end
end
