class CreateMoviesDones < ActiveRecord::Migration[7.1]
  def change
    create_table :movies_dones do |t|
      t.references :actor
      t.references :movie
      t.string :film_location

      t.timestamps
    end
  end
end
