json.array!(@medicaments) do |medicament|
  json.extract! medicament, :id, :description, :dosage, :inventory_min, :medicalrecord_id
  json.url medicament_url(medicament, format: :json)
end
