json.array!(@tasks) do |task|
  json.extract! task, :id, :title, :description, :public
  json.url task_url(task, format: :json)
end
