class User < ActiveRecord::Base
  has many :expenses
end