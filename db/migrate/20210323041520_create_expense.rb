class CreateExpense < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.datetime :date
      t.string :description
      t.float :amount
      t.integer :user_id
    end
  end
end
