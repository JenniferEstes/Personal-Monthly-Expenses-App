class Expense < ActiveRecord::Base
  belongs_to :user
  #ensures only valid data is saved into db
   validates :description, presence: true
end