class MonthBudget < ActiveRecord::Base
  belongs_to :user
  has_many :expenditures, as: :spendable, dependent: :destroy
  validates :target_amount, presence: true, numericality: true

  def expired_budget?
    if self.created_at.month < 12
      Time.now.month - self.created_at.month >= 1
    else
      Time.now.month != 12
    end
  end

  def self.proper_month_budget(user)
    unless user.month_budgets.empty?
      current_budget = user.month_budgets.last
      if current_budget.expired_budget?
        return self.create(target_amount: current_budget.target_amount, user_id: user.id)
      else
        return current_budget
      end
    end
  end
end
