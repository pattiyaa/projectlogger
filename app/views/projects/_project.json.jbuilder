json.extract! project, :id, :name, :detail, :start_date, :end_date, :active, :seq, :user_id, :client_id, :users_id, :created_at, :updated_at
json.url project_url(project, format: :json)