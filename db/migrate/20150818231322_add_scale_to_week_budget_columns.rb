class AddScaleToWeekBudgetColumns < ActiveRecord::Migration
  def change
    change_column :week_budgets, :target_amount, :decimal, precision: 12, scale: 2
    change_column :week_budgets, :current_amount, :decimal, precision: 12, scale: 2
  end
end
