class User < ActiveRecord::Base
  has_one :week_budget
  has_one :month_budget
end
