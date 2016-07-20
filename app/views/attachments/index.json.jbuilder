json.array!(@attachments) do |attachment|
  json.extract! attachment, :id, :name, :description, :file, :attached_item_id, :attached_item_type, :original_filename, :content_type
  json.url attachment_url(attachment, format: :json)
end
