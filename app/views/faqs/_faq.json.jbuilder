json.extract! faq, :id, :query, :answer, :created_at, :updated_at
json.url faq_url(faq, format: :json)
