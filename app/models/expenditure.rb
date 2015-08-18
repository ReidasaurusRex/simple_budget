class Expenditure < ActiveRecord::Base
  belongs_to :spendable, polymorphic: true
end
