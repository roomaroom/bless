class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :status, default: 0
      t.integer :friend_id
      t.integer :profile_id

      t.timestamps
    end

    add_index :friends, :profile_id 
    add_index :friends, :friend_id
  end
end
