class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.text :description
      t.text :setting
      t.integer :type

      t.timestamps null: false
    end

    create_table :profile_pages do |t|
      t.belongs_to :profile, index: true
      t.belongs_to :page, index: true
      t.integer :role
      t.timestamps null: false
    end
  end
end
