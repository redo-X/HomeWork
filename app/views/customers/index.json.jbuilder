json.array!(@customers) do |customer|
  json.extract! customer, :id, :code, :name1, :name2, :phone, :fax, :mail, :contactperson
  json.url customer_url(customer, format: :json)
end
