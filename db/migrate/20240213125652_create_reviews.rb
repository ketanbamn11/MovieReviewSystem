class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.references :user
      t.references :movie
      t.integer :stars
      t.text :review

      t.timestamps
    end
  end
end
