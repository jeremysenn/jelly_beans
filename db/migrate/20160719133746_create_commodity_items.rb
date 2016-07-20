class CreateCommodityItems < ActiveRecord::Migration[5.0]
  def change
    create_table :commodity_items do |t|
      t.decimal :gross
      t.decimal :tare
      t.decimal :price
      t.decimal :total
      t.integer :commodity_id
      t.integer :transaction_id

      t.timestamps
    end
  end
end
