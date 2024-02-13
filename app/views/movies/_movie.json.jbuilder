json.extract! movie, :id, :movie_title, :description, :year, :director, :actor, :film_location, :country, :created_at, :updated_at
json.url movie_url(movie, format: :json)
