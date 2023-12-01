class CategoriesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_category, only: %i[show edit update destroy]
  before_action :set_expense, only: %i[show update destroy]

  def index
    @categories = Category.includes(:author, :expenses).all
  end

  def new
    @category = Category.new
    @category.author_id = current_user.id
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      flash[:success] = 'Category created successfully!'
      redirect_to categories_path
    else
      flash[:alert] = 'Category could not be saved due to validation errors'
      render :new
    end
  end

  private

  def set_category
    @category = Category.find_by(id: params[:category_id])
    return unless @category.nil?

    puts "Category not found for category_id: #{params[:category_id]}"
    redirect_to root_path, alert: 'Category not found'
  end

  def category_params
    params.require(:category).permit(:name, :icon_link)
  end
end
