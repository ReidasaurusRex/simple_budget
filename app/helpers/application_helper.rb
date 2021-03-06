module ApplicationHelper
  def percent_of_budget_spent(budget)
    value = budget.current_amount / budget.target_amount * 100
    return "#{value.to_i}%"
  end
end
