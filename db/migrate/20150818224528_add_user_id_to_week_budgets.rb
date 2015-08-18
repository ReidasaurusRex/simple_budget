class AddUserIdToWeekBudgets < ActiveRecord::Migration
  def change
    add_column :week_budgets, :user_id, :integer
  end
end
