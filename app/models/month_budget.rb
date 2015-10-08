class MonthBudget < ActiveRecord::Base
  belongs_to :user
  has_many :expenditures, as: :spendable, dependent: :destroy
  validates :target_amount, presence: true, numericality: true

  def expired_budget?
    Time.now - self.created_at > 1.month
  end
end
