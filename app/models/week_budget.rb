class WeekBudget < ActiveRecord::Base
  belongs_to :user
  has_many :expenditures, as: :spendable, dependent: :destroy
  validates :target_amount, presence: true, numericality: true

  def expired_budget?
     Time.now - self.created_at > 7.days
  end
end
