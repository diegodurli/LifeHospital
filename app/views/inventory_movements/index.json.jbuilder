json.array!(@inventory_movements) do |inventory_movement|
  json.extract! inventory_movement, :id, :inventory_id, :medicament_id, :quantity, :unit_value, :total_value, :type
  json.url inventory_movement_url(inventory_movement, format: :json)
end
