class Expense < ActiveRecord::Base
  #ensures only valid data is saved into db
   validates :description, presence: true
end