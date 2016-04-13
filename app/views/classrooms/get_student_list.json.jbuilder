json.array!(@students) do |student|
  json.extract! student, :id, :name, :unitec_id, :phone
end
