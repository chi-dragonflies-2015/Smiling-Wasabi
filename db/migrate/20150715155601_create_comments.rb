class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.boolean :rating
      t.references :user
      t.references :commentable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
