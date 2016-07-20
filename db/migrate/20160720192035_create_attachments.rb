class CreateAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :attachments do |t|
      t.string :name
      t.text :description
      t.string :file
      t.integer :attached_item_id
      t.string :attached_item_type
      t.string :original_filename
      t.string :content_type

      t.timestamps
    end
    add_index :attachments, :attached_item_id
    add_index :attachments, :attached_item_type
  end
end
