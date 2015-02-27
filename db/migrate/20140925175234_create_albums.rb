class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.text   :description
      t.integer :profile_id 
      t.integer :pryvacy_id 
      t.timestamps
    end

    add_index :albums, :profile_id 
    add_index :albums, :pryvacy_id 
  end
end
