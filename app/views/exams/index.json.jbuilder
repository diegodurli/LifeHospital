json.array!(@exams) do |exam|
  json.extract! exam, :id, :description, :observations, :archive, :scheduled, :medicalrecord_id
  json.url exam_url(exam, format: :json)
end
