class AddScaleToMonthBudgetColumns < ActiveRecord::Migration
  def change
    change_column :month_budgets, :target_amount, :decimal, precision: 12, scale: 2
    change_column :month_budgets, :current_amount, :decimal, precision: 12, scale: 2
  end
end
