class Movie < ApplicationRecord
    has_many :locations
    has_many :actors, through: :locations
    has_many :reviews
    has_many :user, through: :reviews

    def self.to_csv
        CSV.generate(headers: true) do |csv|
          csv << ["Movie Title", "Description", "Year", "Director", "Actor", "Film Location", "Country"]
    
          all.each do |movie|
            movie.locations.each do |location|
              csv << [movie.movie_title, movie.description, movie.year, movie.director, location.actor&.name, location.name, movie.country]
            end
          end
        end
    end

    def self.to_csv_reviews
        CSV.generate(headers: true) do |csv|
            csv << ["Movie Title", "User", "Stars", "Review"]
      
            all.each do |movie|
              movie.reviews.each do |review|
                csv << [movie.movie_title, review&.user&.email, review.stars, review.review]
              end
            end
        end
    end
end
