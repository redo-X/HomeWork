json.array!(@production_records) do |production_record|
  json.extract! production_record, :id, :start, :finish, :quantity
  json.url production_record_url(production_record, format: :json)
end
