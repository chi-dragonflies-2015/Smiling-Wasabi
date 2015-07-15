class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment_type
      t.references :commentable, polymorphic: true, index: true
      t.references :review
      t.references :film

    end
  end
end
