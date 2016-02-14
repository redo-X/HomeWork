json.array!(@production_orders) do |production_order|
  json.extract! production_order, :id, :number, :description, :quantity, :pending_quantity, :release_date, :due_date, :isCompleted
  json.url production_order_url(production_order, format: :json)
end
