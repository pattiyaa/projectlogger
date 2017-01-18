json.extract! meeting, :id, :meetingdate, :title, :data, :logger_id, :project_id, :created_at, :updated_at
json.url meeting_url(meeting, format: :json)