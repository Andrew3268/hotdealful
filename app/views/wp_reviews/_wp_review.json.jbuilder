json.extract! wp_review, :id, :title, :content, :created_at, :updated_at
json.url wp_review_url(wp_review, format: :json)
