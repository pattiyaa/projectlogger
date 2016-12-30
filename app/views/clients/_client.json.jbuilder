json.extract! client, :id, :name, :contactperson, :telephone, :email, :address, :created_at, :updated_at
json.url client_url(client, format: :json)