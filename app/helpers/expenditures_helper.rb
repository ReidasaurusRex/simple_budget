module ExpendituresHelper
  def new_expenditure_if_logged_in
    binding.pry
    if session[:user_id] && !@new_expenditure_page
      render partial: "expenditures/new_expenditure_button"
    end
  end
end
