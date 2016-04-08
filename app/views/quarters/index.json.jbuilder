json.array!(@quarters) do |quarter|
  json.extract! quarter, :id, :period, :year
  json.url quarter_url(quarter, format: :json)
end
