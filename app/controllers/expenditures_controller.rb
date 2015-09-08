class ExpendituresController < ApplicationController
  before_action :get_user
  before_action :require_login
  def new
  end

  def create
    create_expenditure(expenditure_params)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def create_expenditure(expenditure_params)
    binding.pry
    @user.expenditures.create(expenditure_params)
    redirect_to user_path(@user)
  end

  def expenditure_params
    params.require(:expenditure).permit(:id, :location, :amount, :spendable_id, :spendable_type)
  end
end
