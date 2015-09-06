class MonthBudgetsController < ApplicationController
  before_action :require_login
  before_action :get_user
  before_action :get_month_budget
  def new
  end

  def create
    create_month_budget(month_budget_params)
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end



  private
  def get_month_budget
    @month_budget = @user.month_budget
  end

  def month_budget_params
    params.require(:month_budget).permit(:id, :target_amount).merge(user_id: @user.id)
  end

  def create_month_budget(new_month_budget_params)
    month_budget = MonthBudget.new(new_month_budget_params)
    binding.pry
    if month_budget.save
      redirect_to user_month_budget_path({user_id: @user.id, id: month_budget.id})
    else
      month_budget.destroy
      binding.pry
      flash[:alert] = month_budget.errors.full_messages.join(", ")
      redirect_to new_user_month_budget_path(@user)
    end
  end
end
