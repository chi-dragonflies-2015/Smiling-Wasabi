class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :content
      t.boolean :rating
      t.references :user
      t.references :film

      t.timestamps
    end
  end
end
