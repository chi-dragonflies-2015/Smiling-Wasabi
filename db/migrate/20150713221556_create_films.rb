class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :title
      t.text :description
      t.string :movie_art
      t.timestamps
    end
  end
end
