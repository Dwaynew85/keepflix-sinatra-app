class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genre
      t.string :rating
      t.string :runtime
      t.string :release_date
      t.text :summary
      t.text :image_url
      t.text :link
      t.string :opinion
      t.text :comments
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
