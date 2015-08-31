class AddPolymorphicColumnsToExpenditures < ActiveRecord::Migration
  def change
    add_column :expenditures, :spendable_id, :integer
    add_column :expenditures, :spendable_type, :string
  end
end
