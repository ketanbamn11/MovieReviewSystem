json.extract! review, :id, :stars, :review, :created_at, :updated_at
json.url review_url(review, format: :json)
