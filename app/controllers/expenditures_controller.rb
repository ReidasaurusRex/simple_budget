class ExpendituresController < ApplicationController
  before_action :get_user
  before_action :require_login
  def new
    @new_expenditure_page = true # Ensuring new expenditure button doesn't appear on new expenditure view
  end

  def create
    create_expenditures(@user, expenditure_params, params[:omit_from_week])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def create_expenditures(user, expenditure_params, omit)
    errors = Expenditure.add_expenditures(user, expenditure_params, omit)
    if errors
      flash[:notice] = "Please enter a location and number amount"
      redirect_to new_user_expenditure_path(@user)
    else
      redirect_to user_path(@user)
    end
  end

  def expenditure_params
    params.require(:expenditure).permit(:id, :location, :amount, :spendable_id, :spendable_type)
  end
end
