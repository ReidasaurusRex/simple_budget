class AddUserIdToMonthBudgets < ActiveRecord::Migration
  def change
    add_column :month_budgets, :user_id, :integer
  end
end
