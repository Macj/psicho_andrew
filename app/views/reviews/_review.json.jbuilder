json.extract! review, :id, :name, :link, :created_at, :updated_at
json.url review_url(review, format: :json)
