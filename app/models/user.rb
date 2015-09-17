class User < ActiveRecord::Base
  validates :username, :email, :password_confirmation, :password, presence: true
  validates :email, confirmation: true, uniqueness: true
  has_secure_password

  has_one :week_budget
  has_one :month_budget
  has_many :expenditures, as: :spendable
  
  def smart_username
    username = self.username
    if username.length > 1
      return username[0].upcase + username[1..-1]
    else
      return username
    end
  end  
end
