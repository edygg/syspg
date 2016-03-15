json.array!(@academies) do |academy|
  json.extract! academy, :id, :name, :phone
  json.url academy_url(academy, format: :json)
end
