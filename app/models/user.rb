class User < ActiveRecord::Base
  validates :username, :email, :password_confirmation, :password, presence: true
  validates :email, confirmation: true, uniqueness: true
  has_secure_password

  has_many :week_budgets, dependent: :destroy
  has_many :month_budgets, dependent: :destroy
  has_many :expenditures, as: :spendable, dependent: :destroy
  
  def smart_username
    username = self.username
    if username.length > 1
      return username[0].upcase + username[1..-1]
    else
      return username
    end
  end  
end
