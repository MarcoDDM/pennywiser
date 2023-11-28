require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  let(:user) { create(:user) } # Crea un usuario para autenticar

  before do
    sign_in user # Inicia sesión con el usuario antes de cada prueba
  end

  describe 'GET /categories' do
    it 'renders a successful response' do
      get categories_path
      expect(response).to have_http_status(200)
    end
  end
end
