json.array!(@frequently_asked_questions) do |frequently_asked_question|
  json.extract! frequently_asked_question, :id, :question, :answer
  json.url frequently_asked_question_url(frequently_asked_question, format: :json)
end
