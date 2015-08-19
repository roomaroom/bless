class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.text :description
      t.integer :imageable_id
      t.string  :imageable_type
      t.timestamps
    end

    add_index :photos, :imageable_id
  end
end
