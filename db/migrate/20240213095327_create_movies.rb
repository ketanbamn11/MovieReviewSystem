class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :movie_title
      t.text :description
      t.integer :year
      t.string :director
      t.string :country

      t.timestamps
    end
  end
end
