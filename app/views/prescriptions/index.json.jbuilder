json.array!(@prescriptions) do |prescription|
  json.extract! prescription, :id, :quantity, :unit, :diet, :calories
  json.url prescription_url(prescription, format: :json)
end
