class ExpendituresController < ApplicationController
  before_action :get_user
  before_action :require_login
  def new
  end

  def create
    create_expenditures(@user, expenditure_params)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def create_expenditures(user, expenditure_params)
    binding.pry
    Expenditure.add_expenditures(user, expenditure_params)
    binding.pry
    redirect_to :back
  end

  def expenditure_params
    params.require(:expenditure).permit(:id, :location, :amount, :spendable_id, :spendable_type)
  end
end
