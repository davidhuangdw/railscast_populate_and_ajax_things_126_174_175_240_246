json.array!(@people) do |person|
  json.extract! person, :id, :name, :company, :phone, :country, :state, :city, :zip, :street, :email
  json.url person_url(person, format: :json)
end
