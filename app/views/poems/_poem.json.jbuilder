json.extract! poem, :id, :title, :status, :created_at, :updated_at
json.url poem_url(poem, format: :json)