json.array!(@inventories) do |inventory|
  json.extract! inventory, :id, :total_value, :document
  json.url inventory_url(inventory, format: :json)
end
