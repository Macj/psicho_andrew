json.extract! article, :id, :title, :body, :cathegory_id, :style, :tags, :created_at, :updated_at
json.url article_url(article, format: :json)
