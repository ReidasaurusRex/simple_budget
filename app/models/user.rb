class User < ActiveRecord::Base
  validates :username, :email, :password_confirmation, :password, presence: true
  validates :email, confirmation: true, uniqueness: true
  has_secure_password

  has_one :week_budget
  has_one :month_budget
  has_many :expenditures, as: :spendable
  
end
