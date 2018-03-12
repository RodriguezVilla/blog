json.extract! post, :id, :titulo, :descripticion, :img_destacada_url, :fecha, :created_at, :updated_at
json.url post_url(post, format: :json)
