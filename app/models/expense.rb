class Expense < ActiveRecord::Base
  belongs to :user
  #ensures only valid data is saved into db
   validates :description, presence: true
end