class ApplicationController < ActionController::Base
  before_action :load_and_authorize_resource

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end

  private

  def load_and_authorize_resource
    @current_ability ||= Ability.new(current_user)
    @current_ability.authorize!(params[:action].to_sym, resource)
  end
end
