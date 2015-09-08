class WeekBudgetsController < ApplicationController
  before_action :require_login
  before_action :get_user
  before_action :get_week_budget
  before_action :prevent_new_week_budget_if_existing, only: [:new, :create]
  def new
  end

  def create
    create_week_budget(week_budget_params)
  end

  def show
  end

  def edit
  end

  def update
    update_week_budget(week_budget_params)
  end

  def delete
  end

  def destroy
  end



  private
  def get_week_budget
    @week_budget = @user.week_budget
  end

  def prevent_new_week_budget_if_existing
    redirect_to edit_user_week_budget_path({user_id: @user.id, id: @week_budget.id}) if @user.week_budget
  end

  def week_budget_params
    params.require(:week_budget).permit(:id, :target_amount).merge(user_id: @user.id)
  end

  def create_week_budget(new_week_budget_params)
    week_budget = WeekBudget.new(new_week_budget_params)
    if week_budget.save
      redirect_to user_week_budget_path({user_id: @user.id, id: week_budget.id})
    else
      week_budget.destroy
      flash[:alert] = "Please enter a number for your budget"
      redirect_to new_user_week_budget_path(@user)
    end
  end

  def update_week_budget(edit_week_budget_params)
    @week_budget.update(edit_week_budget_params)
    redirect_to user_week_budget_path({user_id: @user.id, id: @week_budget.id})
  end
end

