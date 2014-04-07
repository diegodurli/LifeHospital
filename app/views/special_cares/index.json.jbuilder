json.array!(@special_cares) do |special_care|
  json.extract! special_care, :id, :description, :desactivation, :hospitalization_id
  json.url special_care_url(special_care, format: :json)
end
