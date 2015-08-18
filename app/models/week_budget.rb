class WeekBudget < ActiveRecord::Base
  belongs_to :user
  has_many :expenditures, as: :spendable
end
