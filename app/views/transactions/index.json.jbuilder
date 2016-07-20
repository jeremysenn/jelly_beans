json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :customer_id, :user_id, :category, :status, :discount, :tax, :total
  json.url transaction_url(transaction, format: :json)
end
