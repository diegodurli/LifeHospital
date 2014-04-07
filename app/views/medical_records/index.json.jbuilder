json.array!(@medical_records) do |medical_record|
  json.extract! medical_record, :id, :description, :historic
  json.url medical_record_url(medical_record, format: :json)
end
