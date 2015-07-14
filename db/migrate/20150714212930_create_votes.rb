class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :vote_type
      t.references :voteable, polymorphic: true, index: true
      t.boolean :value
      t.timestamps
    end
  end
end
