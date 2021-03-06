module ExpendituresHelper
  def new_expenditure_if_logged_in
    if session[:user_id] && !@new_expenditure_page
      render partial: "expenditures/new_expenditure_button"
    end
  end

  def show_expenditures(object)
    if !object.expenditures || object.expenditures.empty?
      "<h3>No expenditures recorded</h3>".html_safe
    else
      render partial: "expenditures/table_without_year", locals: {expenditures: object.expenditures.last_10}
    end
  end
end
