class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :voteable, polymorphic: true, index: true
      t.references :voter
      t.boolean :value
      t.timestamps
    end
  end
end
