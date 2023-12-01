class ExpensesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @category = Category.find(params[:category_id])
    @expenses = @category.expenses.order(created_at: :desc).limit(3)
    @total_amount = @category.expenses.sum(:amount)
  end

  def new
    @category = Category.find(params[:category_id])
    @expense = @category.expenses.build
  end

  def create
    @category = Category.find(params[:category_id])
    @expense = @category.expenses.new(expense_params)
    @expense.user_id = current_user.id

    if @expense.save
      redirect_to category_expenses_path(@category), notice: 'Expense created successfully.'
    else
      flash[:alert] = 'Expense could not be saved due to validation errors.'
      render 'new'
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :category_id, :user_id)
  end
end
