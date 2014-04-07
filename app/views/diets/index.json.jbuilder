json.array!(@diets) do |diet|
  json.extract! diet, :id, :description, :hospitalization_id
  json.url diet_url(diet, format: :json)
end
