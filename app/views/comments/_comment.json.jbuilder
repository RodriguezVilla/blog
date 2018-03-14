json.extract! comment, :id, :commeter, :text_comment, :post_id, :comment_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
