json.array!(@procedures) do |procedure|
  json.extract! procedure, :id, :description, :observations, :scheduled, :medicalrecord_id
  json.url procedure_url(procedure, format: :json)
end
