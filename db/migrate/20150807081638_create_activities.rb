class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.text :body
      t.integer :type
      t.integer :item_id
      t.string :item_type
      t.integer :profile_id, null: false
      t.integer :owner_id
      #t.integer :shared_activity_id
      t.timestamps null: false
    end

    add_index :activities, :item_id
    add_index :activities, :item_type
    add_index :activities, :profile_id
    add_index :activities, :owner_id
    #add_index :activities, :shared_activity_id
  end
end
