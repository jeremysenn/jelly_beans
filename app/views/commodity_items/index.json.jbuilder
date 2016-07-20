json.array!(@commodity_items) do |commodity_item|
  json.extract! commodity_item, :id, :gross, :tare, :price, :total, :commodity_id, :transaction_id
  json.url commodity_item_url(commodity_item, format: :json)
end
