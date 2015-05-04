json.array!(@todos) do |todo|
  json.extract! todo, :id, :done, :title, :description
  json.url todo_url(todo, format: :json)
end
