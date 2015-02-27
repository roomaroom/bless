class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :status, :default => "welcome"
      t.string :city
      t.string :state
      t.datetime :birthday
      t.timestamps
    end

    add_index :profiles, :user_id
  end
end
