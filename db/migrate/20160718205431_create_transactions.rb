class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.integer :customer_id
      t.integer :user_id
      t.string :category
      t.string :status
      t.decimal :discount, default: 0
      t.decimal :tax, default: 0
      t.decimal :total

      t.timestamps
    end
  end
end
