class Expenditure < ActiveRecord::Base
  belongs_to :spendable, polymorphic: true
  validates :location, :amount, presence: true

  def self.add_expenditures(user, params, omit)
    expenditure = user.expenditures.create(params)
    week_budget = user.week_budgets.last
    month_budget = user.month_budgets.last
    if month_budget
      month_budget.expenditures.create(params)
      new_month_amount = month_budget.current_amount += params[:amount].to_d
      month_budget.update(current_amount: new_month_amount)
    end
    if week_budget && !omit
      week_budget.expenditures.create(params)
      new_week_amount = week_budget.current_amount += params[:amount].to_d
      week_budget.update(current_amount: new_week_amount)
    end
    return expenditure.errors.messages unless expenditure.valid? 
  end

  def self.last_10
    self.order(:created_at).last(10).reverse
  end
end
