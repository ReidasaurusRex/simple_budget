class AddDefaultToMonthBudgetCurrent < ActiveRecord::Migration
  def change
    change_column_default :month_budgets, :current_amount, 0
  end
end
