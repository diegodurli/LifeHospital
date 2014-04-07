json.array!(@hospitalizations) do |hospitalization|
  json.extract! hospitalization, :id, :location, :procedures, :treatments, :person_id, :medicalrecord_id
  json.url hospitalization_url(hospitalization, format: :json)
end
