module ApplicationHelper
  def percent_of_budget_spent(budget)
    value = budget.current_amount / budget.target_amount * 100
    return "#{value.to_i}%"
  end

  def sign_out_button
    if session[:user_id]
      link_to("Sign Out", sign_out_path, method: :delete)
    end
  end
end
