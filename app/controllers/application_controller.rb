class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:index], unless: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(_resource)
    categories_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
