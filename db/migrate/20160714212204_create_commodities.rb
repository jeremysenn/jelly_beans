class CreateCommodities < ActiveRecord::Migration[5.0]
  def change
    create_table :commodities do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.string :unit_of_measure
      t.string :category
      t.boolean :active
      t.integer :company_id

      t.timestamps
    end
  end
end
