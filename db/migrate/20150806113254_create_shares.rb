class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.integer :shared_profile_id
      t.integer :shared_activity_id
      t.timestamps
    end
    add_index :shares, :shared_profile_id
    add_index :shares, :shared_activity_id
  end
end
