class AddScaleToExpenditureAmount < ActiveRecord::Migration
  def change
    change_column :expenditures, :amount, :decimal, precision: 12, scale: 2
  end
end
