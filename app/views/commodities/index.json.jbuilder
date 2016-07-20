json.array!(@commodities) do |commodity|
  json.extract! commodity, :id, :name, :price, :description, :unit_of_measure, :category, :active
  json.url commodity_url(commodity, format: :json)
end
