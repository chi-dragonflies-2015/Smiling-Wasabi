class CreateFilmsGenres < ActiveRecord::Migration
  def change
    create_table :films_genres do |t|
      t.references :film
      t.references :genre
      t.timestamps 
    end
  end
end
