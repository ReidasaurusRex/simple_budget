class WeekBudget < ActiveRecord::Base
  belongs_to :user
  has_many :expenditures, as: :spendable, dependent: :destroy
  validates :target_amount, presence: true, numericality: true

  def expired_budget?
     Time.now - self.created_at > 7.days
  end

  def self.proper_week_budget(user)
    current_budget = user.week_budgets.last
    if current_budget.expired_budget?
      return self.create(target_amount: current_budget.target_amount, user_id: user.id)
    else
      return current_budget
    end
  end
end
