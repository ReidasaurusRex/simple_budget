class AddDefaultToWeekBudgetCurrent < ActiveRecord::Migration
  def change
    change_column_default :week_budgets, :current_amount, 0
  end
end
