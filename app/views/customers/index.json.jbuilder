json.array!(@customers) do |customer|
  json.extract! customer, :id, :first_name, :last_name, :business_name, :email, :address1, :address2, :city, :state, :zip, :phone, :id_number, :id_state, :id_expiration, :company_id
  json.url customer_url(customer, format: :json)
end
