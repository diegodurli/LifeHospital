json.array!(@users) do |user|
  json.extract! user, :id, :email, :password_digest, :name, :document, :phone, :address, :contact, :type
  json.url user_url(user, format: :json)
end
