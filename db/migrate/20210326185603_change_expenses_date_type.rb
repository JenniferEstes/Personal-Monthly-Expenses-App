class ChangeExpensesDateType < ActiveRecord::Migration[6.1]
  def change
    change_column :expenses, :date, :date
  end
end