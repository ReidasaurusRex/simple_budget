module WeekBudgetsHelper
  def show_week_budget_summary(user)
    if user.week_budgets.last
      render partial: "week_budgets/summary", locals: {budget: user.week_budgets.last}
    else
      "<h3>#{link_to('Create Week Budget', new_user_week_budget_path(@user))}</h3>".html_safe
    end
  end
end
