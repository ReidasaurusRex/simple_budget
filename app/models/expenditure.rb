class Expenditure < ActiveRecord::Base
  belongs_to :spendable, polymorphic: true

  def self.add_expenditures(user, params)
    user.expenditures.create(params)
    if user.month_budget
      user.month_budget.expenditures.create(params)
      new_month_amount = user.month_budget.current_amount += params[:amount].to_d
      user.month_budget.update(current_amount: new_month_amount)
    end
    if user.week_budget
      user.week_budget.expenditures.create(params)
      new_week_amount = user.week_budget.current_amount += params[:amount].to_d
      user.week_budget.update(current_amount: new_week_amount)
    end
  end

  def self.last_10
    self.order(:created_at).last(10).reverse
  end
end
