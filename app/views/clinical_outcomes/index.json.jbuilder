json.array!(@clinical_outcomes) do |clinical_outcome|
  json.extract! clinical_outcome, :id, :description, :observations, :status, :medicalrecord_id
  json.url clinical_outcome_url(clinical_outcome, format: :json)
end
