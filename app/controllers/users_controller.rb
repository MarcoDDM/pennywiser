class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless current_user == @user
      redirect_to root_path, alert: 'Access denied.'
    end
  end
end
