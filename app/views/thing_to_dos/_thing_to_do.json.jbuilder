json.extract! thing_to_do, :id, :name, :description, :attending, :created_at, :updated_at
json.url thing_to_do_url(thing_to_do, format: :json)
