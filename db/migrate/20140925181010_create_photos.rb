class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.text :description
      t.integer :profile_id 
      t.integer :album_id 
      t.timestamps
    end

    add_index :photos, :profile_id 
    add_index :photos, :album_id  
  end
end
