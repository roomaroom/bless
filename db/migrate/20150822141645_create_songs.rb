class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.string :audio
      t.timestamps null: false
    end

    create_table :profile_songs do |t|
      t.belongs_to :profile, index: true
      t.belongs_to :song, index: true
      t.timestamps null: false
    end
  end
end
