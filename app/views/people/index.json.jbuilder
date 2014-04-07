json.array!(@people) do |person|
  json.extract! person, :id, :name, :document, :phone, :address, :contact, :type
  json.url person_url(person, format: :json)
end
