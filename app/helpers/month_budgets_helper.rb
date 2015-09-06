module MonthBudgetsHelper
  def show_month_budget_summary(user)
    if user.month_budget
      render partial: "month_budgets/summary", locals: {budget: user.month_budget}
    else 
      "<h3>#{link_to('Create Month Budget', new_user_month_budget_path(@user))}</h3>".html_safe
    end
  end
end
