json.array!(@serums) do |serum|
  json.extract! serum, :id, :description
  json.url serum_url(serum, format: :json)
end
