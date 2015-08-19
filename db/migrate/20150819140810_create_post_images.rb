class CreatePostImages < ActiveRecord::Migration
  def change
    create_table :post_images do |t|
      t.belongs_to :photo, index: true
      t.belongs_to :post, index: true
      t.timestamps null: false
    end
  end
end
