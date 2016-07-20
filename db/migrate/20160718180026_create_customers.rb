class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :business_name
      t.string :email
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :id_number
      t.string :id_state
      t.date :id_expiration
      t.integer :company_id

      t.timestamps
    end
  end
end
