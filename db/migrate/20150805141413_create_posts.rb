class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :title
      t.text :body
      t.integer :profile_id
      t.integer :wall_id
      t.string :image
      t.timestamps
    end
    add_index  :posts, :profile_id
    add_index  :posts, :wall_id
  end
end
