# En tu archivo 'spec/models/user_spec.rb'
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

  # Puedes agregar pruebas adicionales para los módulos de Devise si es necesario.

  # Asegúrate de que todas las configuraciones necesarias de RSpec y FactoryBot estén en su lugar en tu aplicación Rails.

  # Si no estás utilizando FactoryBot, reemplaza las líneas 'create(:user)' y 'create(:category, author: user)' con tus propios métodos de creación de objetos.
end
