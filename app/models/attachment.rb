class Attachment < ApplicationRecord
  
  mount_uploader :file, FileUploader

  # Associations
  belongs_to :attached_item, polymorphic: true
  
end
