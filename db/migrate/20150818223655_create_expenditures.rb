class CreateExpenditures < ActiveRecord::Migration
  def change
    create_table :expenditures do |t|
      t.decimal :amount
      t.string :location

      t.timestamps null: false
    end
  end
end
