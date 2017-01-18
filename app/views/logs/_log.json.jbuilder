json.extract! log, :id, :logdate, :data, :logperson_id, :project_id, :created_at, :updated_at
json.url log_url(log, format: :json)