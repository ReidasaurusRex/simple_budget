class CreateWeekBudgets < ActiveRecord::Migration
  def change
    create_table :week_budgets do |t|
      t.decimal :target_amount
      t.decimal :current_amount

      t.timestamps null: false
    end
  end
end
